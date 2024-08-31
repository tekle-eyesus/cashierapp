import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(
              color: Color.fromARGB(255, 11, 0, 218),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Icon(
              Icons.settings,
              size: 29,
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 100,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "email or Username",
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(187, 42, 72, 219),
                      Color.fromARGB(255, 238, 69, 69),
                      // const Color.fromARGB(255, 252, 247, 247)
                    ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.amber,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "History",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(186, 8, 47, 240),
                      Color.fromARGB(255, 245, 51, 51),
                      // const Color.fromARGB(255, 252, 247, 247)
                    ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Favorite",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ExpansionTile(
              leading:
                  Icon(Icons.handshake, color: Color.fromARGB(255, 11, 0, 218)),
              backgroundColor: Colors.black12,
              title: Text("User Agreement"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.system_update_alt,
                color: Color.fromARGB(255, 11, 0, 218),
              ),
              backgroundColor: Colors.black12,
              title: Text("Version Update"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.code,
                color: Color.fromARGB(255, 11, 0, 218),
              ),
              backgroundColor: Colors.black12,
              title: Text("Other Services"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
