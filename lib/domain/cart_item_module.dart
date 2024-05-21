import 'dart:math';

import 'package:advanced_test/core/helpers/list.dart';
import 'package:advanced_test/core/helpers/static_data.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import 'food_item_module.dart';

class CartItemModule {
  int count;
  bool isDragged = false;

  final FoodItemModule item;

  CartItemModule({required this.count, required this.item});
}
