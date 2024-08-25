import 'package:cashier_app/screens/addProduct_screen.dart';
import 'package:cashier_app/screens/cart_screen.dart';
import 'package:cashier_app/screens/menu_screen.dart';
import 'package:cashier_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool darkMode = false;
  void handleScreenOption(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> options = [
    MenuScreen(),
    CartScreen(),
    AddScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.black, size: 26),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          onTap: handleScreenOption,
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueGrey,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Home",
                icon: Icon(
                  Icons.home_outlined,
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Cart",
                icon: Icon(
                  Icons.shopping_cart_outlined,
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Add",
                icon: Icon(
                  Icons.add,
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Profile",
                icon: Icon(
                  Icons.person,
                ))
          ]),
      body:
          SafeArea(child: MaterialApp(home: options.elementAt(selectedIndex))),
    );
  }
}
