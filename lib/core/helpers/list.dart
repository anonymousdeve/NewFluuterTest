import 'package:flutter/cupertino.dart';

extension ShuffleList<T> on List<T> {
  List<T> shuffled() {
    List<T> newList = List.of(this); // Create a copy of the original list
    newList.shuffle(); // Shuffle the copy
    return newList; // Return the shuffled list
  }
}

extension FilterToExtension<T> on Iterable<T> {
  C filterTo<C extends List<dynamic>>(C destination, bool Function(T) predicate) {
    for (var element in this) {
      if (predicate(element)) {
        destination.add(element);
      }
    }
    return destination;
  }
}
extension IterableFilterExtension<T> on Iterable<T> {
  List<T> filter(bool Function(T) predicate) {
    return filterTo([],predicate);
  }
}