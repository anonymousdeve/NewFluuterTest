import 'dart:math';

import 'package:advanced_test/core/helpers/list.dart';
import 'package:advanced_test/core/helpers/static_data.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class FoodItemModule {
  int id = DateTime.now().millisecondsSinceEpoch;
  final String name;
  final List<String> photos;
  final String price;

  final String deliveryInfo;
  bool isLiked;
  final String returnPolicy;
  final String descriptions;

  FoodItemModule(
      {required this.name,
      required this.photos,
      required this.price,
      required this.deliveryInfo,
      required this.isLiked,
      required this.returnPolicy,
      required this.descriptions});
}

List<FoodItemModule> foodItems = List.generate(12, (index) {
  Set<String> newList = <String>{};
  newList.add(images[Random(DateTime.now().millisecondsSinceEpoch + index)
      .nextInt(images.length)]);
  newList.addAll(images);

  return FoodItemModule(
      name: loremIpsum(words: 2),
      photos: newList.toList().shuffled(),
      price: (Random().nextDouble() * 200).toStringAsFixed(2),
      deliveryInfo: loremIpsum(words: 50),
      isLiked: false,
      returnPolicy: loremIpsum(words: 100),
      descriptions: loremIpsum(words: 25));
});
