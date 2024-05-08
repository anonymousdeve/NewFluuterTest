import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font65Weight800 = TextStyle(
      fontSize: 56.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'SFProRounded',
      color: AppColors.textOnScreen);
  static TextStyle font14Weight400 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProRounded',
      color: AppColors.textOnScreen);
}
