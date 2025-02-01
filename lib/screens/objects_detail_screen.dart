import 'package:ar_app_flutter/screens/ar_objects_screen.dart';
import 'package:ar_app_flutter/utils/colors.dart';
import 'package:ar_app_flutter/widgets/appbar.dart';
import 'package:ar_app_flutter/widgets/button.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../utils/sizes.dart';
import '../widgets/rounded_container.dart';

class ObjectsDetailScreen extends StatelessWidget {
  const ObjectsDetailScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AAppBar(showBackArrow: true, title: Text('AR Object Details')),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ASizes.spaceBtwItems),

              // Image
              ARoundedContainer(
                child: Image.asset(
                  card.image,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: ASizes.xs),
              Text(
                card.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: ASizes.spaceBtwItems),

              // Description
              ARoundedContainer(
                bgColor: AColors.secondaryVariant,
                padding: const EdgeInsets.all(ASizes.defaultSpace),
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
                    SizedBox(height: ASizes.spaceBtwItems),
                    Center(
                      child: Text(
                        card.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // View in 3D button
              AButtonWidget(
                bgColor: AColors.buttonColor,
                icon: Icons.threed_rotation,
                text: 'View in 3D',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AR3DObjectsScreen(card: card),
                  ),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
