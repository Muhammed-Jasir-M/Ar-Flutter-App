import 'package:ar_app_flutter/data/cards.dart';
import 'package:ar_app_flutter/models/shopping_cart_model.dart';
import 'package:ar_app_flutter/screens/ar_objects_screen.dart';
import 'package:ar_app_flutter/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E5E9),
      appBar: AAppBar(
        title: const Text('AR Objects',
            style: TextStyle(fontSize: 24, color: Colors.black54)),
      ),
      body: Column(
        children: <Widget>[
          // Cards grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: cards
                    .map(
                      (card) => InkWell(
                        onTap: () => onTap(card),
                        child: Card(
                          elevation: 4,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                card.image as String,
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                card.title,
                                style: TextStyle(color: Colors.black54),
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

  // Handles the tap event on the card
  void onTap(ShopCardModel card) {
    // Set the card as active
    setState(() {
      card.isActive = !card.isActive;
    });
    // Navigate to the AR screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ARObjectsScreen(
          object: card.object,
          isLocal: card.isLocal,
        ),
      ),
    ).then((value) {
      // Set the card as inActive
      setState(() {
        card.isActive = !card.isActive;
      });
    });
  }
}
