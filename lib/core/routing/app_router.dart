import 'package:advanced_test/core/route_transition/left_oute_transitions.dart';
import 'package:advanced_test/core/routing/routes.dart';
import 'package:advanced_test/features/cart/cart_screen.dart';
import 'package:advanced_test/features/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../features/login/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return moveWithAnimations(const OnBoardingScreen());

      case Routes.loginScreen:
        return moveWithAnimations(const AuthScreen());

      case Routes.homeScreen:
        return moveWithAnimations(const HomeScreen());

      case Routes.cartScreen:
        return moveWithAnimations(const CartScreen());

      default:
        return moveWithAnimations(Scaffold(
          body: Center(
            child: Text("No rout defined for ${settings.name}"),
          ),
        ));
    }
  }

  Route moveWithAnimations(Widget page) {
    return SlidLeft(builder: (_) => page);
  }
}
