import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/Favorite_stores/manager/fav_list_provider.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/units/constants/colors.dart';
import 'package:shopping_app/units/snak_bar.dart';

class FavoriteStoreListView extends StatelessWidget {
  const FavoriteStoreListView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: stores.length,
        itemBuilder: (context, index) {
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
                      image: NetworkImage(stores[index].imageUrl),
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
                trailing: Consumer<FavoriteStoreListProvider>(
                  builder: (context, favoriteStoreListProvider, _) => IconButton(
                    icon: Icon(
                      stores[index].isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: stores[index].isFavorite ? Colors.red : null,
                    ),
                    onPressed: () async {
                      String message = '';
                      if (stores[index].isFavorite) {
                        await favoriteStoreListProvider
                            .removeFromFavorites(stores[index]);
                        message = "Store removed from favorites";
                      } else {
                        await favoriteStoreListProvider.addToFavorites(stores[index]);
                        message = "Store added to favorites";
                      }
                      SnakBar.showSnakBar(context, message, Colors.green,
                          CupertinoIcons.check_mark);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}