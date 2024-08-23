import 'package:cashier_app/data/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTitle extends StatefulWidget {
  final String name;
  final int price;
  const CartTitle({super.key, required this.name, required this.price});

  @override
  State<CartTitle> createState() => _CartTitleState();
}

class _CartTitleState extends State<CartTitle> {
  String? namep;
  get name => String;
  get price => int;

  int amount = 1;

  void handleIncrement() {
    setState(() {
      amount++;
    });
  }

  void handleDecrement() {
    if (amount != 1) {
      setState(() {
        amount--;
      });
    }
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
            "$name",
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
                      onPressed: () {},
                      child: Icon(Icons.delete_forever_outlined)),
                ),
              ],
            ),
          ),
          trailing: Text(
            price.toString(),
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
