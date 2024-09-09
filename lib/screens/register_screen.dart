import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/data/user_data.dart';
import 'package:cashier_app/model/user.dart';
import 'package:cashier_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var newEmailController = TextEditingController();
    var newUsernameController = TextEditingController();
    var newPasswordController = TextEditingController();

    void handleBack() {
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    }

    void addNewUser() {
      String username = newUsernameController.text.toString();
      String password = newPasswordController.text.toString();
      String emailAdd = newEmailController.text.toString();
      if (username.isNotEmpty && password.isNotEmpty && emailAdd.isNotEmpty) {
        User newUser =
            User(email: emailAdd, username: username, password: password);
        Provider.of<ProductStore>(context, listen: false)
            .insertNewUser(newUser);
        print(newUser.username);

        showDialog(
            context: context,
            builder: (BuildContext) {
              return AlertDialog.adaptive(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  "Success !!",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your registration completed successfully",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(31, 5, 1, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                    onTap: handleBack,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 11, 35, 249),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "OK",
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 35, 249),
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext) {
              return AlertDialog.adaptive(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text(
                  "Fill all fields",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "To register, you have to enter all required data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(31, 5, 1, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 11, 35, 249),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "OK",
                        style: TextStyle(
                          color: Color.fromARGB(255, 11, 35, 249),
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 34, 184),
        title: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 160, bottom: 5),
                  child: Text(
                    "Enter Email-Address :",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 223, 231),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(5),
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    controller: newEmailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.email),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                      ),
                      hintText: "example@gmail.com",
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 230, bottom: 5, top: 10),
                  child: Text(
                    "Username",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 223, 231),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(5),
                  width: 300,
                  child: TextField(
                    controller: newUsernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person_rounded),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                      ),
                      hintText: "username",
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 230, bottom: 5, top: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 223, 231),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(5),
                  width: 300,
                  child: TextField(
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      suffix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Icon(Icons.remove_red_eye),
                      ),
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.key),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                      ),
                      hintText: "",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: addNewUser, child: Text("Register")),
                SizedBox(
                  width: 10,
                ),
                OutlinedButton(onPressed: () {}, child: Text("Back To login"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
