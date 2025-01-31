import 'package:ar_app_flutter/models/card_model.dart';
import 'package:ar_app_flutter/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AR3DObjectsScreen extends StatelessWidget {
  const AR3DObjectsScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(title: Text(card.title), showBackArrow: true),
      body: Center(
        child: ModelViewer(
          backgroundColor: Colors.white,
          src: card.object,
          alt: "${card.title} 3D model",
          ar: true,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}