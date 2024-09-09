import 'package:cashier_app/data/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  AddScreen({
    super.key,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String hintText = "Select Category";
  String? categoryValue;
  @override
  Widget build(BuildContext context) {
    final newProductNameController = TextEditingController();
    final newProductPriceController = TextEditingController();

    void clearController() {
      newProductPriceController.clear();
      newProductNameController.clear();
      setState(() {
        hintText = "Select Category";
      });
    }

    void addProduct() {
      if (newProductPriceController.text.isEmpty ||
          newProductNameController.text.isEmpty ||
          categoryValue == null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Error!!"),
                  content: Text("Fill all fields !"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"))
                  ],
                ));
      } else {
        String pname = newProductNameController.text;
        int pprice = int.parse(newProductPriceController.text);
        String? pcategory = categoryValue;
        String imageUrl = "assets/images/focaccia.jpg";

        List produt = [pname, pprice, pcategory, imageUrl];
        print(produt);

        Provider.of<ProductStore>(context, listen: false).addNewProduct(produt);
        clearController();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Success!"),
                  content: Text("product Successfully Added"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"))
                  ],
                ));
      }
    }

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 232, 226, 226)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(
                  "Add New Products",
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 65,
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(right: 150),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 32, 216),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                iconSize: 35,
                icon: hintText != "Select Category"
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.green,
                        ),
                      )
                    : Icon(Icons.arrow_drop_down_outlined),
                underline: Text(""),
                hint: Text(
                  hintText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                dropdownColor: Color.fromARGB(255, 221, 217, 206),
                items: [
                  DropdownMenuItem(value: "drink", child: Text("drink")),
                  DropdownMenuItem(value: "food", child: Text("food")),
                  DropdownMenuItem(value: "snack", child: Text("snack")),
                ],
                onChanged: (value) {
                  setState(() {
                    hintText = value!;
                    categoryValue = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: newProductNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          weight: 15,
                          Icons.food_bank,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "Enter Product Name",
                      hintStyle: TextStyle(fontSize: 20)),
                )),
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: newProductPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          weight: 15,
                          Icons.attach_money,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "Price",
                      hintStyle: TextStyle(fontSize: 20)),
                )),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: addProduct,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 34, 184),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      child: Text("ADD"))),
            ),
          ],
        ),
      ),
    );
  }
}
