import 'package:cashier_app/model/productItem.dart';
import 'package:flutter/material.dart';

class ProductData extends ChangeNotifier {
  List<ProductItem> productList = [];

  //to get the product list

  List<ProductItem> getProductList() {
    return productList;
  }

  //to add new product

  void addNProductToCart(ProductItem newProduct) {
    productList.add(newProduct);
  }
}
