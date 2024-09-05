import 'package:cashier_app/data/product_store.dart';
import 'package:cashier_app/data/user_data.dart';
import 'package:cashier_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User loggedUser =
        Provider.of<ProductStore>(context, listen: false).getUserData();
    List<String> userAgreements = [];

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
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 80,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (loggedUser.username),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      loggedUser.email,
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(186, 11, 40, 188),
                      Color.fromARGB(255, 12, 15, 184),
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
                            color: Colors.white,
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
                      Color.fromARGB(185, 8, 38, 189),
                      Color.fromARGB(255, 50, 37, 159),
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
                            color: Colors.white,
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
                      "Theis user agreement is legal agreement between you(either An individual or a single entity) and Vein Services Co."),
                  subtitle: Text(
                      "👉 By using theis app or any other Vein software product you accept the terms of this agreement.If you do not accept this terms ,do not use any vein software product or service \n"
                      "👉 Vein grants you a limited non-exclusive licence to install, use,access, and run this app \n"
                      "👉 vein may make updates , upgrades to the vein software available to you ,including bug fixes and service upgrades. "),
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
                      "A software update can include ,but is not limited to:"),
                  subtitle: Text(
                      "  👉 Device stablity improvements, bug fix \n  👉 New and /or enhanced features. \n  👉 Further improvements to performance \nTo get the best from your App,please keep your app up to date and regularly check for software updates."),
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
