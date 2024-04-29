import 'package:flutter/material.dart';

class LoginData extends ChangeNotifier {
  String? email;
  String? password;
  bool showEmailNotExist = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setShowEmailNotExist(bool value) {
    showEmailNotExist = value;
    notifyListeners();
  }
}
