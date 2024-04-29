import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/authentication/models/user.dart';
import 'package:shopping_app/features/home/models/store.dart';

class SharedPreferencesService {
  static const String _keyUserList = 'userList';
  static const String _keyStoreList = 'storeList';

  // Private method to save the list of users
  static Future<void> _saveUserList(List<User> userList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userStrings =
        userList.map((user) => json.encode(user.toJson())).toList();
    await prefs.setStringList(_keyUserList, userStrings);
  }

  // Get all users from the list
  static Future<List<User>> getAllUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userStrings = prefs.getStringList(_keyUserList);
    if (userStrings == null) {
      return [];
    }
    return userStrings
        .map((userString) => User.fromJson(json.decode(userString)))
        .toList();
  }

  // Add a user to the list of users
  static Future<void> addUser(User user) async {
    List<User> userList = await getAllUsers();
    userList.add(user);
    await _saveUserList(userList);
  }

  // Remove a user from the list of users
  static Future<void> removeUser(String email) async {
    List<User> userList = await getAllUsers();
    userList.removeWhere((user) => user.email == email);
    await _saveUserList(userList);
  }

  // Check if the email exists in the list of users
  static Future<bool> doesEmailExist(String email) async {
    List<User> userList = await getAllUsers();
    return userList.any((user) => user.email == email);
  }

  // Check if the email and password match
  static Future<bool> doEmailAndPasswordMatch(
      String email, String password) async {
    List<User> userList = await getAllUsers();
    return userList
        .any((user) => user.email == email && user.password == password);
  }

  // Save list of stores
  static Future<void> saveStores(List<StoreModel> stores) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storeStrings =
        stores.map((store) => json.encode(store.toJson())).toList();
    await prefs.setStringList(_keyStoreList, storeStrings);
  }

  // Remove all stores
  static Future<void> removeAllStores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyStoreList);
  }

  // Get all stores
  static Future<List<StoreModel>> getAllStores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storeStrings = prefs.getStringList(_keyStoreList);
    if (storeStrings == null) {
      return [];
    }
    return storeStrings
        .map((storeString) => StoreModel.fromJson(json.decode(storeString)))
        .toList();
  }

  // Add store to favorites
  static Future<void> addToFavorites(StoreModel store) async {
    List<StoreModel> stores = await getAllStores();
    int index = stores.indexWhere((s) => s.name == store.name);
    if (index != -1) {
      stores[index].isFavorite = true;
      await saveStores(stores);
    }
  }

  // Remove store from favorites
  static Future<void> removeFromFavorites(StoreModel store) async {
    List<StoreModel> stores = await getAllStores();
    int index = stores.indexWhere((s) => s.name == store.name);
    if (index != -1) {
      stores[index].isFavorite = false;
      await saveStores(stores);
    }
  }

  // Get all favorite stores
  static Future<List<StoreModel>> getFavoriteStores() async {
    List<StoreModel> stores = await getAllStores();
    return stores.where((store) => store.isFavorite).toList();
  }
}
