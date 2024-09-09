import 'package:cashier_app/model/productItem.dart';
import 'package:cashier_app/model/user.dart';
import 'package:flutter/material.dart';

class ProductStore extends ChangeNotifier {
  final List _storeList = [
    ["Shero", 300, "food", "assets/images/focaccia.jpg"],
    ["Tella", 40, "drink", "assets/images/funghi.jpg"],
    ["wine", 200, "drink", "assets/images/margherita.jpg"],
    ["Burger", 500, "snack", "assets/images/prosciutto.jpg"],
    ["Teji", 50, "drink", "assets/images/salamino.jpg"],
    ["Chips", 10, "snack", "assets/images/prosciutto.jpg"],
    ["Dullet", 240, "food", "assets/images/prosciutto.jpg"],
    ["Pizza", 200, "drink", "assets/images/prosciutto.jpg"],
    ["Water", 500, "drink", "assets/images/prosciutto.jpg"],
    ["Spinaci", 50, "Snack", "assets/images/prosciutto.jpg"],
    ["margherita", 50, "Snack", "assets/images/prosciutto.jpg"],
    ["salamino", 50, "Snack", "assets/images/focaccia.jpg"],
  ];

  final List _storeDrinkList = [];
  final List _storeFoodList = [];
  final List _storeSnackList = [];

  List<ProductItem> _cartList = [];

  ProductItem getObject(int index) {
    return _cartList.elementAt(index);
  }

  void addProductToCart(ProductItem itemObject) {
    bool added = false;
    for (var element in _cartList) {
      if (element.productName == itemObject.productName) {
        element.proAmount = element.proAmount + 1;
        added = true;
        print(element.proAmount);
      }
    }

    if (!added) {
      _cartList.add(itemObject);
      notifyListeners();
    } else {
      print("repeted...");
    }
  }

  int getAmount(int index) {
    int pamount = 1;
    for (var i = 0; i < _cartList.length; i++) {
      pamount = _cartList[index].proAmount;
    }

    return pamount;
  }

  void deleteFromCart(ProductItem product) {
    _cartList.remove(product);
    notifyListeners();
  }

  void deleteFromCartByIndex(int index) {
    _cartList.removeAt(index);
    notifyListeners();
  }

  int getTotalPrice() {
    int total = 0;
    for (var element in _cartList) {
      total = (element.price * element.proAmount) + total;
    }

    return total;
  }

  bool called = false;
  void devider() {
    if (!called) {
      for (var element in _storeList) {
        if (element[2].toString().toLowerCase().contains("drink")) {
          _storeDrinkList.add(element);
          called = true;
        } else if (element[2].toString().toLowerCase().contains("food")) {
          _storeFoodList.add(element);
          called = true;
        } else if (element[2].toString().toLowerCase().contains("snack")) {
          _storeSnackList.add(element);
          called = true;
        }
      }
    }
  }

  get storeList => _storeList;
  get storeDrikList => _storeDrinkList;
  get storeFoodList => _storeFoodList;
  get storeSnackList => _storeSnackList;
  get cartList => _cartList;

  void addNewProduct(List x) {
    _storeList.add(x);
    notifyListeners();
  }

  List getStoreList() {
    return storeList;
  }

  //user data

  List<User> _userList = [];
  get userList => _userList;

  void insertNewUser(User newUser) {
    _userList.add(newUser);
  }

  int isUserFound(String username, String password) {
    int found = 0; //1 & 0
    for (var element in userList) {
      if (element.username == username && element.password == password) {
        found = 1;
        print("you are found ");
      }
    }
    return found;
  }

  User getUserData() {
    return userList[0];
  }
}
