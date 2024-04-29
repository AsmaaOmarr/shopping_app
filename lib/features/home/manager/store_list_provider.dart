import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/units/local_storage/shared_prefs.dart';

class StoreListProvider extends ChangeNotifier {
  List<StoreModel> _stores = [];

  List<StoreModel> get stores => _stores;

  void getAllStores() async {
    _stores = await SharedPreferencesService.getAllStores();
    notifyListeners();
  }

  Future<void> addToFavorites(StoreModel store) async {
    await SharedPreferencesService.addToFavorites(store);
    store.isFavorite = true;
    notifyListeners();
  }

  Future<void> removeFromFavorites(StoreModel store) async {
    await SharedPreferencesService.removeFromFavorites(store);
    store.isFavorite = false;
    notifyListeners();
  }
}
