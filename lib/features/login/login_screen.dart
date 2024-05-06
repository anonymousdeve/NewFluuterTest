import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Stack(
        children: [
          Container(
            height: .38.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.mainScreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.w),
                bottomRight: Radius.circular(30.w),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 98.w,
                height: 98.h,
                child: SvgPicture.asset("assets/svg/logo.svg"),
              ),
            ),
          )

        ],
      ),
    );
  }
}
