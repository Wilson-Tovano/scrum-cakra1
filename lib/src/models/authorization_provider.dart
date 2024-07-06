import 'package:flutter/material.dart';

class AuthorizationProvider with ChangeNotifier {
  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;

  void setAdminStatus(String email, String password) {
    if(email == 'admin' && password == 'admin'){
      _isAdmin = true;
    }else{
      _isAdmin = false;
    }

    notifyListeners();
    print(_isAdmin);
  }

  void logOut(){
    _isAdmin = false;
  }
}
