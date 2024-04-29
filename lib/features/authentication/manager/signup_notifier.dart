import 'package:flutter/material.dart';

class SignUpData extends ChangeNotifier {
  String? fullName;
  String? email;
  String? password;
  String? cPassword;
  bool showEmailExist = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  
  void setFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setCPassword(String value) {
    cPassword = value;
    notifyListeners();
  }

  void setShowEmailExist(bool value) {
    showEmailExist = value;
    notifyListeners();
  }
}
