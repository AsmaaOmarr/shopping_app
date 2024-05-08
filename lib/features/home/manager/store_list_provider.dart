import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';

class StoreListProvider extends ChangeNotifier {
  final String userEmail;
  List<StoreModel> _stores = [];
  List<StoreModel> get stores => _stores;
  List<int> _favoriteStoreIds = [];
  List<int> get favoriteStoreIds => _favoriteStoreIds;

  StoreListProvider({required this.userEmail}) {
    _stores = [];
    _favoriteStoreIds = [];
    _init();
  }

  Future<void> _init() async {
    await getFavoriteStoreIds();
  }

  Future<void> getAllStores() async {
    _stores = await DatabaseService.getAllStores();
    notifyListeners();
  }

  Future<void> addToFavorites(StoreModel store) async {
    await DatabaseService.addToFavoriteStores(userEmail, store.id);
    _favoriteStoreIds.add(store.id);
    notifyListeners();
  }

  Future<void> removeFromFavorites(StoreModel store) async {
    await DatabaseService.removeFromFavoriteStores(userEmail, store.id);
    _favoriteStoreIds.remove(store.id);
    notifyListeners();
  }

  Future<void> getFavoriteStoreIds() async {
    _favoriteStoreIds = await DatabaseService.getUserFavStoreIds(userEmail);
    notifyListeners();
  }
}
