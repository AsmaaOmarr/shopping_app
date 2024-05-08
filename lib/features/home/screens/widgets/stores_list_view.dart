import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/store_list_provider.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/snack_bar.dart';
import '../../models/store.dart';

class StoreListView extends StatelessWidget {
  const StoreListView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final storeListProvider = context.watch<StoreListProvider>();
          bool isFav =
              storeListProvider.favoriteStoreIds.contains(stores[index].id);
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(stores[index].imageUrl),
                    ),
                  ),
                ),
                title: Text(
                  stores[index].name,
                  style: const TextStyle(fontFamily: AppColors.kFontFamily),
                ),
                subtitle: Text(
                  stores[index].address,
                  style: const TextStyle(fontFamily: AppColors.kFontFamily),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: isFav ? Colors.red : null,
                  ),
                  onPressed: () async {
                    String message = '';
                    if (isFav) {
                      await storeListProvider
                          .removeFromFavorites(stores[index]);
                      message = "Store removed from favorites";
                    } else {
                      await storeListProvider.addToFavorites(stores[index]);
                      message = "Store added to favorites";
                    }
                    SnakBar.showSnakBar(context, message, Colors.green,
                        CupertinoIcons.check_mark);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
