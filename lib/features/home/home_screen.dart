import 'package:advanced_test/core/helpers/navigation_ext.dart';
import 'package:advanced_test/core/helpers/static_data.dart';
import 'package:advanced_test/core/routing/routes.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/domain/food_item_module.dart';
import 'package:advanced_test/features/home/home.dart';
import 'package:advanced_test/features/home/widgets/side_menu.dart';
import 'package:advanced_test/features/item/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> animation;
  int selectedPos = 0;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainOrange,
      body: Stack(
        children: [
          AnimatedPositioned(
            width: .8.sw,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -.8.sw,
            top: 0,
            child: const SideMenuWidget(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * .7.sw, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isSideBarOpen ? 24.w : 0.0),
                  ),
                  child: const Home(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? .7.sw : 32.w,
            top: 72.h,
            child: SizedBox(
              width: .85.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      isSideBarOpen = !isSideBarOpen;
                      if (isSideBarOpen) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 32.h,
                      child: !isSideBarOpen
                          ? SvgPicture.asset('assets/svg/ic_closed_menu.svg')
                          : SvgPicture.asset('assets/svg/ic_opened_menu.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.cartScreen,
                          arguments: cartItems);
                    },
                    child: SizedBox(
                      width: 32.w,
                      height: 32.h,
                      child: SvgPicture.asset('assets/svg/ic_cart.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomWidget()
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      left: isSideBarOpen ? 1.sw : 32.w,
      bottom: 32.h,
      child: SizedBox(
        width: .85.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 10),
                decoration: selectedPos == 0
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.mainOrange.withOpacity(0.05),
                          spreadRadius: 20,
                          // Adjust the spread radius of the shadow
                          blurRadius: 8,
                          // Adjust the blur radius of the shadow
                          offset: const Offset(
                              0, .5), // Adjust the offset of the shadow
                        ),
                      ])
                    : null,
                child: selectedPos == 0
                    ? const Icon(
                        Icons.home,
                        color: AppColors.mainOrange,
                      )
                    : const Icon(Icons.home_outlined),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 1;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: selectedPos == 1
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.mainOrange.withOpacity(0.05),
                          spreadRadius: 8.w,
                          // Adjust the spread radius of the shadow
                          blurRadius: 2,
                          // Adjust the blur radius of the shadow
                          offset: const Offset(
                              0, .2), // Adjust the offset of the shadow
                        ),
                      ])
                    : null,
                child: selectedPos == 1
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.mainOrange,
                      )
                    : const Icon(Icons.favorite_border),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 2;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: selectedPos == 2
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.mainOrange.withOpacity(0.05),
                          spreadRadius: 8.w,
                          // Adjust the spread radius of the shadow
                          blurRadius: 2,
                          // Adjust the blur radius of the shadow
                          offset: const Offset(
                              0, .2), // Adjust the offset of the shadow
                        ),
                      ])
                    : null,
                child: selectedPos == 2
                    ? const Icon(
                        Icons.person,
                        color: AppColors.mainOrange,
                      )
                    : const Icon(Icons.person_2_outlined),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPos = 3;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: selectedPos == 3
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.mainOrange.withOpacity(0.05),
                          spreadRadius: 8.w,
                          // Adjust the spread radius of the shadow
                          blurRadius: 2.w,
                          // Adjust the blur radius of the shadow
                          offset: const Offset(
                              0, .2), // Adjust the offset of the shadow
                        ),
                      ])
                    : null,
                child: selectedPos == 3
                    ? const Icon(
                        Icons.history_outlined,
                        color: AppColors.mainOrange,
                      )
                    : const Icon(Icons.history_toggle_off),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
