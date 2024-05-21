import 'dart:math';

import 'package:advanced_test/domain/cart_item_module.dart';

List mainCat = [
  "Foods",
  "Drinks",
  "Snacks",
  "Fast Food",
  "Fish",
  "Chicken",
  "Beef"
];

List<String> images =
    List.generate(9, (index) => "assets/images/foodImage$index.png");
final List categories =
    List.generate(10, (index) => mainCat[Random().nextInt(mainCat.length)]);

Map<int, CartItemModule> cartItems = {};
