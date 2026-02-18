import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {

  String _currentUserName = "";


  String get currentUserName => _currentUserName;


  bool get isLoggedIn => _currentUserName.isNotEmpty;

  void login(String userName) {
    _currentUserName = userName;
    notifyListeners();
  }

  void logout() {
    _currentUserName = "";
    notifyListeners();
  }
}
