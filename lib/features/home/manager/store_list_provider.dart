import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';

class StoreListProvider extends ChangeNotifier {
  List<StoreModel> _stores = [];

  List<StoreModel> get stores => _stores;

  void getAllStores() async {
    _stores = await DatabaseService.getAllStores();
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
