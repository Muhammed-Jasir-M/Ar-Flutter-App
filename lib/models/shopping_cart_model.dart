import 'package:flutter/material.dart';

class ShopCardModel {
  final IconData image;
  final String title;
  bool isActive = false;
  final String object;
  final bool isLocal;

  ShopCardModel(
    this.image,
    this.title,
    this.isActive,
    this.object,
    this.isLocal,
  );
}
