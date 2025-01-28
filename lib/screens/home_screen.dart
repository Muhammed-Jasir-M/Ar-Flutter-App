import 'package:ar_app_flutter/models/ar_objects.dart';
import 'package:ar_app_flutter/models/shopping_cart_model.dart';
import 'package:ar_app_flutter/screens/ar_objects_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ShopCardModel> mycard = [
    ShopCardModel(Icons.shopping_bag, 'Shoe', false, ARObjects.shoe, false),
    ShopCardModel(Icons.apartment, 'Chair', false, ARObjects.chair, false),
    ShopCardModel(Icons.home, 'Chicken', false, ARObjects.chicken, true),
    ShopCardModel(Icons.grade, 'Figure', false, ARObjects.figure, false),
    ShopCardModel(Icons.animation, 'Fox', false, ARObjects.fox, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7f9),
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Let's shopping!",
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: mycard
                    .map(
                      (e) => InkWell(
                        onTap: () => onTap(e),
                        child: Card(
                          color: e.isActive ? Colors.blue : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                e.icon,
                                size: 50,
                                color: e.isActive ? Colors.white : Colors.blue,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                e.title,
                                style: TextStyle(
                                    color: e.isActive
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTap(ShopCardModel e) {
    setState(() {
      e.isActive = !e.isActive;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ARObjectsScreen(
                  object: e.object,
                  isLocal: e.isLocal,
                ))).then((value) {
      setState(() {
        e.isActive = !e.isActive;
      });
    });
  }
}
