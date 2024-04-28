import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/authentication/models/user.dart';

class SharedPreferencesService {

  static const String _keyUserList = 'userList';

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

  // Method to get a user by email
  static Future<User?> getUserByEmail(String email) async {
    List<User> userList = await getAllUsers();
    return userList.firstWhere((user) => user.email == email);
  }

  static Future<void> updateUserByEmail(String email, User updatedUser) async {
    List<User> userList = await getAllUsers();
    int index = userList.indexWhere((user) => user.email == email);
    if (index != -1) {
      userList[index] = updatedUser;
      await _saveUserList(userList);
    }
  }
}

