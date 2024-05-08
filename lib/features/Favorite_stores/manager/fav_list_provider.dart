import 'package:flutter/cupertino.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';

class FavoriteStoreListProvider extends ChangeNotifier {
  List<StoreModel> _stores = [];

  List<StoreModel> get stores => _stores;

  void getAllFavoriteStores() async {
    _stores = await DatabaseService.getFavoriteStores();
    notifyListeners();
  }

  Future<void> addToFavorites(StoreModel store) async {
    await DatabaseService.addToFavorites(store);
    store.isFavorite = true;
    notifyListeners();
  }

  Future<void> removeFromFavorites(StoreModel store) async {
    await DatabaseService.removeFromFavorites(store);
    store.isFavorite = false;
    notifyListeners();
  }
}
