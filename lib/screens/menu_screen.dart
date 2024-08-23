import 'package:cashier_app/customWidget/product_title.dart';
import 'package:cashier_app/data/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isAllPressed = true;
  bool isDrinkPressed = false;
  bool isFoodPressed = false;
  bool isSnackPressed = false;

  void handleContainerColor() {
    setState(() {
      isAllPressed = !isAllPressed;
      if (isDrinkPressed) {
        isDrinkPressed = !isDrinkPressed;
      } else if (isFoodPressed) {
        isFoodPressed = !isFoodPressed;
      } else if (isSnackPressed) {
        isSnackPressed = !isSnackPressed;
      }
    });
  }

  void handleDrinkColor() {
    setState(() {
      isDrinkPressed = !isDrinkPressed;
      if (isAllPressed) {
        isAllPressed = !isAllPressed;
      } else if (isFoodPressed) {
        isFoodPressed = !isFoodPressed;
      } else if (isSnackPressed) {
        isSnackPressed = !isSnackPressed;
      }
      Provider.of<ProductStore>(context, listen: false).devider();
    });
  }

  void handleFoodColor() {
    Provider.of<ProductStore>(context, listen: false).devider();
    setState(() {
      isFoodPressed = !isFoodPressed;
      if (isDrinkPressed) {
        isDrinkPressed = !isDrinkPressed;
      } else if (isAllPressed) {
        isAllPressed = !isAllPressed;
      } else if (isSnackPressed) {
        isSnackPressed = !isSnackPressed;
      }
    });
  }

  void handleSnackColor() {
    Provider.of<ProductStore>(context, listen: false).devider();
    setState(() {
      isSnackPressed = !isSnackPressed;
      if (isDrinkPressed) {
        isDrinkPressed = !isDrinkPressed;
      } else if (isFoodPressed) {
        isFoodPressed = !isFoodPressed;
      } else if (isAllPressed) {
        isAllPressed = !isAllPressed;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              "Menu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 5, 174),
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  hintText: "Search product...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 5, left: 0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: handleContainerColor,
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                      color: (isAllPressed)
                          ? Color.fromARGB(255, 11, 0, 218)
                          : Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.all_inbox,
                          size: 35,
                          color: (isAllPressed)
                              ? Colors.white
                              : Color.fromARGB(255, 11, 0, 218),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                              color: (isAllPressed)
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 16,
                            ),
                            child: Text("All"))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: handleDrinkColor,
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                      color: (isDrinkPressed)
                          ? Color.fromARGB(255, 11, 0, 218)
                          : Color.fromARGB(26, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.water_drop,
                          size: (isDrinkPressed) ? 40 : 35,
                          color: (isDrinkPressed)
                              ? Colors.white
                              : Color.fromARGB(255, 11, 0, 218),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                              color: (isDrinkPressed)
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 16,
                            ),
                            child: Text("Drink"))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: handleFoodColor,
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                      color: (isFoodPressed)
                          ? Color.fromARGB(255, 11, 0, 218)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.food_bank,
                          size: 35,
                          color: (isFoodPressed)
                              ? Colors.white
                              : Color.fromARGB(255, 11, 0, 218),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                              color: (isFoodPressed)
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 16,
                            ),
                            child: Text("Food"))
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: handleSnackColor,
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 11, 0, 218)),
                      color: (isSnackPressed)
                          ? Color.fromARGB(255, 11, 0, 218)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.local_pizza,
                          size: 35,
                          color: (isSnackPressed)
                              ? Colors.white
                              : Color.fromARGB(255, 11, 0, 218),
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                              color: (isSnackPressed)
                                  ? Colors.white
                                  : Color.fromARGB(255, 11, 0, 218),
                              fontSize: 16,
                            ),
                            child: Text("Snack"))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<ProductStore>(
                builder: (context, value, child) {
                  return isAllPressed
                      ? GridView.builder(
                          itemCount: value.storeList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ProductTitle(
                                productName: value.storeList[index][0],
                                price: value.storeList[index][1],
                                category: value.storeList[index][2],
                                onPressed: () {
                                  Provider.of<ProductStore>(context,
                                          listen: false)
                                      .addProductToCart(index);
                                });
                          },
                        )
                      : isDrinkPressed
                          ? GridView.builder(
                              itemCount: value.storeDrikList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return ProductTitle(
                                    productName: value.storeDrikList[index][0],
                                    price: value.storeDrikList[index][1],
                                    category: value.storeDrikList[index][2],
                                    onPressed: () {
                                      Provider.of<ProductStore>(context,
                                              listen: false)
                                          .addProductToCart(index);
                                    });
                              },
                            )
                          : isSnackPressed
                              ? GridView.builder(
                                  itemCount: value.storeSnackList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return ProductTitle(
                                        productName: value.storeSnackList[index]
                                            [0],
                                        price: value.storeSnackList[index][1],
                                        category: value.storeSnackList[index]
                                            [2],
                                        onPressed: () {
                                          Provider.of<ProductStore>(context,
                                                  listen: false)
                                              .addProductToCart(index);
                                        });
                                  },
                                )
                              : GridView.builder(
                                  itemCount: value.storeFoodList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return ProductTitle(
                                        productName: value.storeFoodList[index]
                                            [0],
                                        price: value.storeFoodList[index][1],
                                        category: value.storeFoodList[index][2],
                                        onPressed: () {
                                          Provider.of<ProductStore>(context,
                                                  listen: false)
                                              .addProductToCart(index);
                                        });
                                  },
                                );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
