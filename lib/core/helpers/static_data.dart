import 'dart:math';

List mainCat = [
  "Foods",
  "Drinks",
  "Snacks",
  "Fast Food",
  "Fish",
  "Chicken",
  "Beef"
];

List images = List.generate(7, (index) => "assets/images/foodImage$index.png");
final List categories =
List.generate(10, (index) => mainCat[Random().nextInt(mainCat.length)]);