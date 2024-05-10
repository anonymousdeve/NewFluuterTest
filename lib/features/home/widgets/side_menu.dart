import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:advanced_test/features/home/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'menu_item.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .8.sw,
        height: double.infinity,
        color: AppColors.mainOrange,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: .2.sh),
          child: Column(
            children: [
              for (int i = 0; i < listOfMenuItems.length; i++)
                menuItem(listOfMenuItems[i].name, listOfMenuItems[i].icon,
                    selectedPos == i, () {
                  setState(() {
                    selectedPos = i;
                  });
                }),

            ],
          ),
        ),
      ),
    );
  }
}

final listOfMenuItems = [
  MenuItemModel(name: "Home", icon: 'assets/svg/ic_home.svg'),
  MenuItemModel(name: "Shopping Cart", icon: 'assets/svg/ic_cart.svg'),
  MenuItemModel(name: "Offers", icon: 'assets/svg/ic_offers.svg'),
  MenuItemModel(name: "Privacy policy", icon: 'assets/svg/ic_privacy.svg'),
  MenuItemModel(name: "Security", icon: 'assets/svg/ic_security.svg'),
];
