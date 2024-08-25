import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/model/productItem.dart';
import 'package:cashier_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTitle extends StatefulWidget {
  final String proName;
  final int price;
  final String category;
  final int index;
  final int pAmount;

// why the values are not defined in the class that extends the state
  const CartTitle({
    super.key,
    required this.proName,
    required this.price,
    required this.category,
    required this.index,
    required this.pAmount,
  });

  @override
  // ignore: no_logic_in_create_state
  State<CartTitle> createState() => _CartTitleState(proName, price, category,
      index, pAmount); //i think there is the problem hereeee
}

class _CartTitleState extends State<CartTitle> {
  String? productName;
  String? productCategory;
  int? productPrice;
  int? productKey;
  int? amount;

  _CartTitleState(
      String proName, int price, String category, int key, int proAmount) {
    productCategory = category;
    productPrice = price;
    productName = proName;
    productKey = key;
    amount = proAmount;
    // onClick = onClick;
  }
  int _getAmount() {
    return Provider.of<ProductStore>(context, listen: false)
        .getAmount(productKey!);
  }

  void handleIncrement() {
    setState(() {
      amount = amount! + 1;

      ProductItem pItem = ProductItem(
          productName: productName!,
          category: productCategory!,
          price: productPrice!,
          proAmount: amount!);

      Provider.of<ProductStore>(context, listen: false).addProductToCart(pItem);
    });
  }

  void handleDecrement() {
    if (amount != 1) {
      setState(() {
        amount = amount! - 1;

        ProductItem pItem = ProductItem(
            productName: productName!,
            category: productCategory!,
            price: productPrice!,
            proAmount: amount!);

        Provider.of<ProductStore>(context, listen: false)
            .addProductToCart(pItem);
      });
    }
  }

  void deleteProduct() {
    print(productKey);
    ProductItem itemToDelete = Provider.of<ProductStore>(context, listen: false)
        .getObject(productKey!);
    Provider.of<ProductStore>(context, listen: false)
        .deleteFromCart(itemToDelete);
    print(itemToDelete.productName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductStore>(builder: (context, value, child) {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color.fromARGB(255, 14, 0, 206))),
        child: ListTile(
          isThreeLine: true,
          title: Text(
            "${productName}",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          leading: Icon(
            Icons.circle_outlined,
            size: 70,
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 35,
                  height: 35,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.only(left: 0)),
                        iconColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: handleIncrement,
                      child: Icon(Icons.add)),
                ),
                Text(
                  "$amount",
                  style: TextStyle(
                    decoration: TextDecoration.overline,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 35,
                  height: 35,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.only(left: 0)),
                        iconColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: handleDecrement,
                      child: Icon(Icons.remove)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 30,
                  height: 30,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.only(left: 0)),
                        iconColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: deleteProduct,
                      child: Icon(Icons.delete_forever_outlined)),
                ),
              ],
            ),
          ),
          trailing: Text(
            "${(productPrice! * amount!)}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}
