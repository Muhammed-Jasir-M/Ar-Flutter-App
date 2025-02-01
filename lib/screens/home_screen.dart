import 'package:ar_app_flutter/data/cards.dart';
import 'package:ar_app_flutter/screens/objects_detail_screen.dart';
import 'package:ar_app_flutter/utils/sizes.dart';
import 'package:ar_app_flutter/widgets/appbar.dart';
import 'package:ar_app_flutter/widgets/rounded_container.dart';
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
      // App bar
      appBar: AAppBar(
        title: Center(
          child: const Text(
            'AR Objects',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: Column(
          children: <Widget>[
            // Cards grid
            Expanded(
              child: GridView.builder(
                itemCount: cards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  final card = cards[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ObjectsDetailScreen(card: card),
                        ),
                      );
                    },
                    child: ARoundedContainer(
                      width: double.infinity,
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Image
                          Image.asset(
                            card.image,
                            width: double.infinity,
                            height: 80,
                          ),
                          const SizedBox(height: 10),
                          // Title
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ASizes.xs),
                            child: Center(
                              child: Text(
                                card.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
