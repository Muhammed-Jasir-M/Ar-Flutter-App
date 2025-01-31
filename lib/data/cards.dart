import 'package:ar_app_flutter/utils/ar_objects.dart';
import 'package:ar_app_flutter/models/shopping_cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<ShopCardModel> cards = [
  ShopCardModel(CupertinoIcons.car, 'BMW', false, ARObjects.bmw, true),
  ShopCardModel(CupertinoIcons.add, 'Chicken', false, ARObjects.chicken, true),
  ShopCardModel(Icons.phone, 'IPhoneex', false, ARObjects.iphoneex, true),
  ShopCardModel(Icons.female, 'Skelton', false, ARObjects.skelton, true),
  ShopCardModel(Icons.sunny, 'Earth', false, ARObjects.earth, true),
  ShopCardModel(Icons.home, 'Spinosaurus', false, ARObjects.spinosaurus, true),
  ShopCardModel(Icons.home, 'Alien', false, ARObjects.alien, true),
];
