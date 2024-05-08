import 'package:flutter/cupertino.dart';
import 'package:shopping_app/features/home/models/store.dart';
import 'package:shopping_app/utils/local_storage/sq_lite.dart';

class FavoriteStoreListProvider extends ChangeNotifier {
  List<StoreModel> _stores = [];

  FavoriteStoreListProvider({required this.userEmail});

  List<StoreModel> get stores => _stores;

  final String userEmail;

  void getAllFavoriteStores() async {
    _stores = await DatabaseService.getFavoriteStores(userEmail);
    notifyListeners();
  }

  Future<void> removeFromFavorites(StoreModel store) async {
    await DatabaseService.removeFromFavoriteStores(userEmail, store.id);
    notifyListeners();
  }
}
