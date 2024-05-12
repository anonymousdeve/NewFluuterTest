import 'package:flutter/material.dart';


class SlidLeft extends MaterialPageRoute {
  SlidLeft({required super.builder})
      : super(fullscreenDialog: true);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var start = const Offset(-1, 0);
    var tween = Tween(begin: start, end: Offset.zero);
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}