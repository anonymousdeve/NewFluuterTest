import 'package:advanced_test/core/route_transition/left_oute_transitions.dart';
import 'package:advanced_test/core/routing/routes.dart';
import 'package:advanced_test/domain/cart_item_module.dart';
import 'package:advanced_test/domain/food_item_module.dart';
import 'package:advanced_test/features/cart/cart_screen.dart';
import 'package:advanced_test/features/home/home_screen.dart';
import 'package:advanced_test/features/item/item_details_screen.dart';
import 'package:flutter/material.dart';

import '../../features/login/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments; // Retrieve arguments passed to the route

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return moveWithAnimations(const OnBoardingScreen());

      case Routes.loginScreen:
        return moveWithAnimations(const AuthScreen());

      case Routes.homeScreen:
        return moveWithAnimations(const HomeScreen());

      case Routes.cartScreen:
        return moveWithAnimations(
            CartScreen(items: args is Map<int, CartItemModule> ? args :{}));
      // get argument as FoodItemModule
      case Routes.itemDetails:
        if (args is FoodItemModule) {
          return moveWithAnimations(ItemDetails(itemModule: args));
        } else {
          // Handle error or fallback behavior if args is not of expected type
          return moveWithAnimations(
              errorScreen("Invalid argument type for ItemDetails route"));
        }
      default:
        return moveWithAnimations(
            errorScreen("No rout defined for ${settings.name}"));
    }
  }

  Route moveWithAnimations(Widget page) {
    return SlidLeft(builder: (_) => page);
  }

  Widget errorScreen(String msg) {
    return Scaffold(
      body: Center(
        child: Text(msg),
      ),
    );
  }
}
