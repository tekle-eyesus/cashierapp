import 'dart:html';

import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/model/productItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTitle extends StatelessWidget {
  final String productName;
  final int price;
  final String category;
  final String image;

  const ProductTitle({
    super.key,
    required this.category,
    required this.price,
    required this.productName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    void newObject() {
      int count = 1;
      ProductItem pItem = ProductItem(
          imageURL: image,
          productName: productName,
          category: category,
          price: price,
          proAmount: count);

      Provider.of<ProductStore>(context, listen: false).addProductToCart(pItem);
    }

    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        color: Color.fromARGB(255, 234, 234, 234),
        borderRadius: BorderRadius.circular(10),
      ),
      // foregroundDecoration: BoxDecoration(
      //   image: DecorationImage(image: AssetImage(image)),
      // ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              width: 200,
              height: 140,
              scale: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  backgroundColor: Colors.amber,
                ),
                child: Text("${productName}")),
          ),
          Container(
            margin: EdgeInsets.only(top: 75),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text('\$' + "${price}")),
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 47, 38, 203),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      onPressed: newObject,
                      icon: Icon(
                        size: 20,
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
