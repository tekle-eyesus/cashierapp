import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/model/productItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTitle extends StatelessWidget {
  final String productName;
  final int price;
  final String category;

  const ProductTitle({
    super.key,
    required this.category,
    required this.price,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    void newObject() {
      ProductItem pItem = ProductItem(
          productName: productName, category: category, price: price);

      Provider.of<ProductStore>(context, listen: false).addProductToCart(pItem);
    }

    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        color: Color.fromARGB(255, 234, 234, 234),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            Icons.food_bank,
            size: 50,
          ),
          DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
              child: Text("${productName}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
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
          )
        ],
      ),
    );
  }
}
