import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/data/products_data.dart';
import 'package:cashier_app/screens/home_screen.dart';
import 'package:cashier_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void handleUserLogin() {
    final String username = usernameController.text.toString();
    final String password = passwordController.text.toString();

    if (username.isNotEmpty && password.isNotEmpty) {
      int isFound = Provider.of<ProductStore>(context, listen: false)
          .isUserFound(username, password);
      if (isFound == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext) {
              return AlertDialog.adaptive(
                title: Text("Error"),
                content: Text("Incorrect password/username"),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog.adaptive(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Empty username/password"),
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Icon(
                  Icons.food_bank_rounded,
                  color: Color.fromARGB(255, 11, 0, 218),
                  size: 50,
                ),
                Text(
                  "Cashier App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "fast and reliable payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "username",
                          hintStyle: TextStyle(fontSize: 20)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              weight: 15,
                              Icons.key_rounded,
                            ),
                          ),
                          suffix: Icon(Icons.remove_red_eye_sharp),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 20)),
                    )),
                InkWell(
                  onTap: handleUserLogin,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 4, 34, 184),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  })),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Color.fromARGB(255, 4, 34, 184)),
                    ),
                    child: Text(
                      "CREATE NEW ACCOUNT",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 34, 184),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Icon(Icons.code),
                Text(
                  "CopyRight @ 2024 veinTech",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
