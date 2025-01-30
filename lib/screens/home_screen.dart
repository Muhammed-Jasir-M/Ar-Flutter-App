import 'package:ar_app_flutter/data/cards.dart';
import 'package:ar_app_flutter/screens/ar_objects_detail_screen.dart';
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
      backgroundColor: const Color(0xFFE3E5E9),
      appBar: AAppBar(
        title: Center(
          child: const Text('AR Objects',
              style: TextStyle(fontSize: 24, color: Colors.black54)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                          builder: (context) => ArObjectsDetailScreen(card: card),
                        ),
                      );
                    },
                    child: ARoundedContainer(
                      width: double.infinity,
                      height: 120,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(40),
                              child: Image.asset(
                                card.image,
                                width: 100,
                                height: 80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            card.title,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
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
