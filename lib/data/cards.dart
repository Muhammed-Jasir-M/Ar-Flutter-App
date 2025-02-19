import 'package:ar_app_flutter/utils/ar_objects.dart';
import 'package:ar_app_flutter/models/card_model.dart';
import 'package:ar_app_flutter/utils/descriptions.dart';
import 'package:ar_app_flutter/utils/images.dart';

List<CardModel> cards = [
  CardModel(image: AImages.bed, title: 'Bed 1', description: ADescriptions.bed, object: ARObjects.bed1),
  CardModel(image: AImages.alien, title: 'Alien', description: ADescriptions.alien, object: ARObjects.alien),
  CardModel(image: AImages.chicken, title: 'Chicken', description: ADescriptions.chicken, object: ARObjects.chicken),
  CardModel(image: AImages.sun, title: 'Sun', description: ADescriptions.sun, object: ARObjects.sun),
  CardModel(image: AImages.moon, title: 'Moon', description: ADescriptions.moon, object: ARObjects.moon),

  CardModel(image: AImages.pluto, title: 'Pluto', description: ADescriptions.pluto, object: ARObjects.pluto),
  CardModel(image: AImages.ceres, title: 'Ceres', description: ADescriptions.ceres, object: ARObjects.ceres),

  CardModel(image: AImages.skelton, title: 'Human Skeleton', description: ADescriptions.skelton, object: ARObjects.skelton),
 
  CardModel(image: AImages.bed, title: 'Bed 2', description: ADescriptions.bed, object: ARObjects.bed2),
];
