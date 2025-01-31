import 'package:ar_app_flutter/screens/ar_objects_screen.dart';
import 'package:ar_app_flutter/screens/three_d_objects_screen.dart';
import 'package:ar_app_flutter/widgets/appbar.dart';
import 'package:ar_app_flutter/widgets/button.dart';
import 'package:flutter/material.dart';

import '../models/shopping_cart_model.dart';
import '../widgets/rounded_container.dart';

class ObjectsDetailScreen extends StatelessWidget {
  const ObjectsDetailScreen({super.key, required this.card});

  final ShopCardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(showBackArrow: true, title: Text('AR Object Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ARoundedContainer(
                child: Image.asset(
                  card.image,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: Text(
                  card.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ARoundedContainer(
                bgColor: const Color(0xFFEEEEEE),
                padding: const EdgeInsets.all(8),
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        card.description,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // View in 3D & AR button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AButtonWidget(
                    bgColor: Color(0xffE0E0E0),
                    icon: Icons.threed_rotation,
                    text: 'View in 3D',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThreeDObjectsScreen(card: card),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  AButtonWidget(
                    icon: Icons.camera,
                    text: 'View in AR',
                    bgColor: Color(0xff9E9E9E),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ARObjectsScreen(
                          title: card.title,
                          object: card.object,
                          isLocal: card.isLocal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
