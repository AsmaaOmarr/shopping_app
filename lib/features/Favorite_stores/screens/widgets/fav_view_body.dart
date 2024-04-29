import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/Favorite_stores/manager/fav_list_provider.dart';

import 'fav_stores_list_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<FavoriteStoreListProvider>(
        builder: (context, favoriteStoreListProvider, _) {
          favoriteStoreListProvider.getAllFavoriteStores();
          return Column(
            children: [
              FavoriteStoreListView(
                stores: favoriteStoreListProvider.stores,
              ),
            ],
          );
        },
      ),
    );
  }
}
