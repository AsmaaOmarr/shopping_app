import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/manager/store_list_provider.dart';
import 'stores_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<StoreListProvider>(
        builder: (context, storeListProvider, _) {
          storeListProvider.getAllStores();
          return Column(
            children: [
              StoreListView(
                stores: storeListProvider.stores,
              ),
            ],
          );
        },
      ),
    );
  }
}
