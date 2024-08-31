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

  bool isDark = false;

  void handleContainerColor() {
    setState(() {
      if (!isAllPressed) {
        isAllPressed = !isAllPressed;
      }

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
      if (!isDrinkPressed) {
        isDrinkPressed = !isDrinkPressed;
      }

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
      if (!isFoodPressed) {
        isFoodPressed = !isFoodPressed;
      }

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
      if (!isSnackPressed) {
        isSnackPressed = !isSnackPressed;
      }

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
      color: Colors.amber,
      home: Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          title: DefaultTextStyle(
            style: TextStyle(
              color: Color.fromARGB(255, 5, 5, 174),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              "Menu",
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("about")),
                      PopupMenuItem(
                          onTap: () => setState(() {
                                isDark = !isDark;
                              }),
                          child: Text(isDark ? "Light Mode" : "Dark"))
                    ])
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: !isDark ? Colors.blueAccent : Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onTap: () => showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        mainList:
                            Provider.of<ProductStore>(context, listen: false)
                                .getStoreList())),
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
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.grey,
                  ),
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
                              image: value.storeList[index][3],
                            );
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
                                  image: value.storeList[index][3],
                                );
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
                                      category: value.storeSnackList[index][2],
                                      image: value.storeList[index][3],
                                    );
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
                                      image: value.storeList[index][3],
                                    );
                                  },
                                );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List mainList;
  CustomSearchDelegate({required this.mainList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List productQuery = [];
    for (var i = 0; i < mainList.length; i++) {
      if (mainList[i][0]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          mainList[i][1]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          mainList[i][2]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        productQuery.add(mainList[i]);
      }
    }

    return ListView.builder(
        itemCount: productQuery.length,
        itemBuilder: (context, index) {
          var result = productQuery[index];
          return ListTile(
            title: Text(result[0].toString()),
            subtitle: Text(result[1]),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List productQuery = [];
    for (var i = 0; i < mainList.length; i++) {
      if (mainList[i][0]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          mainList[i][1]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          mainList[i][2]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        productQuery.add(mainList[i]);
      }
    }

    return ListView.builder(
        itemCount: productQuery.length,
        itemBuilder: (context, index) {
          var result = productQuery[index];
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6)),
                color: const Color.fromARGB(26, 247, 235, 235),
                border: Border.all(color: Color.fromARGB(255, 11, 0, 218))),
            child: ListTile(
              leading: Image.asset(
                result[3],
                scale: 10,
              ),
              title: Text(
                result[0].toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "\$${result[1]}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 11, 0, 218),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    weight: 10,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
