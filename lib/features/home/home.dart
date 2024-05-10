import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainScreenColorDarker,
      height: 1.sh,
      child: const Center(child: Text("Test Home")),
    );
  }
}
