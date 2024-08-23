import 'package:cashier_app/customWidget/cart_title.dart';
import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/data/products_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        title: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          child: Text("Order Detail"),
        ),
        actions: [
          Icon(
            Icons.payment_rounded,
            size: 35,
          )
        ],
      ),
      body: Consumer<ProductStore>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.cartList.length,
            itemBuilder: ((context, index) => CartTitle(
                  name: value.cartList[index][0],
                  price: value.cartList[index][1],
                )));
      }),
    ));
  }
}
