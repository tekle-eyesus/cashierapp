import 'package:cashier_app/model/productItem.dart';
import 'package:flutter/material.dart';

class ProductStore extends ChangeNotifier {
  final List _storeList = [
    ["shero", 300, "food"],
    ["tella", 40, "drink"],
    ["wine", 200, "drink"],
    ["burger", 500, "snack"],
    ["teje", 50, "drink"],
    ["Chips", 10, "snack"],
    ["dullet", 240, "food"],
    ["wine", 200, "drink"],
    ["water", 500, "drink"],
    ["teje", 50, "drink"]
  ];

  final List _storeDrinkList = [];
  final List _storeFoodList = [];
  final List _storeSnackList = [];

  final List<ProductItem> _cartList = [];

  ProductItem getObject(int index) {
    return _cartList.elementAt(index);
  }

  void addProductToCart(ProductItem itemObject) {
    bool added = false;
    for (var element in _cartList) {
      if (element.productName == itemObject.productName) {
        added = true;
      }
    }

    if (!added) {
      _cartList.add(itemObject);
      notifyListeners();
    } else {
      print("repeted...");
    }
  }

  void deleteFromCart(ProductItem product) {
    _cartList.remove(product);
    notifyListeners();
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
}
