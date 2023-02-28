import 'dart:convert';
import 'package:flutter/services.dart';

List foods = [];
List categories = [
  "All",
];
Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final data = await json.decode(response);
  foods = data["items"];
  foods.forEach((element) {
    if (!categories.contains(element["category"])) {
      categories.add(element["category"]);
    }
    ;
  });
}

List findCategory() {
  categories = categories.toSet().toList();

  return categories;
}

List foodItems(category, type) {
  List food = [];
  print(foods.length);
  foods.forEach((element) {
    print(element["category"]);
    if (category == 'All' && element["type"] == type) {
      food.add(element);
    } else if (element["category"] == category && element["type"] == type) {
      food.add(element);
    }
  });
  return food;
}
