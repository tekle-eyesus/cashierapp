import 'package:cashier_app/model/user.dart';
import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  List<User> userList = [];

  List<User> getUser() {
    return userList;
  }
}
