import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                label: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "EnterEmail Adress",
                  ),
                ),
                hintText: "example@gmail.com",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                label: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Username",
                  ),
                ),
                hintText: "",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                label: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Password",
                  ),
                ),
                hintText: "",
              ),
            ),
          )
        ],
      ),
    );
  }
}
