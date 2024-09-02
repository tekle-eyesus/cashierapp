import 'package:cashier_app/model/user.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  List<User> _userList = [];
  get userList => _userList;

  void insertNewUser(User newUser) {
    _userList.add(newUser);
  }

  User getUser(String username) {
    return userList[0];
  }
}
