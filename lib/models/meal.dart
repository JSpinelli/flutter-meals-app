import 'package:flutter/material.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});

  static String complexityText(Complexity value) {
    switch (value){
      case Complexity.Challenging: return 'Challeging'; break;
      case Complexity.Hard: return 'Hard'; break;
      case Complexity.Simple: return 'Simple'; break;
    }
  }

  static String affordabilityText(Affordability value) {
    switch (value){
      case Affordability.Affordable: return 'Affordable'; break;
      case Affordability.Pricey: return 'Pricey'; break;
      case Affordability.Luxurious: return 'Luxurious'; break;
    }
  }
}
