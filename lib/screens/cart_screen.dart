import 'package:cashier_app/customWidget/cart_title.dart';
import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/data/products_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCashPressed = true;
  bool isQrPressed = false;
  int totalPrice = 0;
  int getPrice() {
    setState(() {
      totalPrice =
          Provider.of<ProductStore>(context, listen: false).getTotalPrice();
    });

    return totalPrice;
  }

  void handleCash() {
    setState(() {
      isCashPressed = !isCashPressed;
      if (isQrPressed) {
        isQrPressed = !isQrPressed;
      }
    });
  }

  void handleQRcode() {
    setState(() {
      isQrPressed = !isQrPressed;
      if (isCashPressed) {
        isCashPressed = !isCashPressed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      persistentFooterButtons: [
        Container(
          margin: EdgeInsets.all(10),
          width: 500,
          height: 160,
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: handleCash,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 160,
                      height: 70,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                        color: isCashPressed
                            ? Color.fromARGB(255, 11, 0, 218)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.money,
                            size: 35,
                            color: isCashPressed
                                ? Colors.white
                                : Color.fromARGB(255, 11, 0, 218),
                          ),
                          Text(
                            "Cash",
                            style: TextStyle(
                              color: isCashPressed
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: handleQRcode,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 160,
                      height: 70,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                        color: isQrPressed
                            ? Color.fromARGB(255, 11, 0, 218)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: 35,
                            color: isQrPressed
                                ? Colors.white
                                : Color.fromARGB(255, 11, 0, 218),
                          ),
                          Text(
                            "QR",
                            style: TextStyle(
                              color: isQrPressed
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 500,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 4, 23, 239),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$" + getPrice().toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Process",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
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
                  proName: value.cartList[index].productName,
                  price: value.cartList[index].price,
                  category: value.cartList[index].category,
                  index: index,
                )));
      }),
    ));
  }
}
