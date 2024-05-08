import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/features/onboarding/widgets/app_logo_name.dart';
import 'package:advanced_test/features/onboarding/widgets/bottom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainOrange,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 72.h, bottom: 32.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogoAndName(),
              SizedBox(
                height: 32.h,
              ),
              const BottomImages(),


            ],
          ),
        ),
      ),
    );
  }
}
