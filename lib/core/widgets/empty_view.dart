
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/app_colors.dart';
import '../theming/styles.dart';

Widget messageImage(String image) {
  return Positioned(
    top: 250.h,
    left: 0,
    right: 0,
    child: Center(
      child: SvgPicture.asset(
        image,
        height: 150.h,
      ),
    ),
  );
}

Widget messageText(String textTitle, String msg) {
  return Positioned(
    top: 415.h,
    left: 0,
    right: 0,
    child: Column(
      children: [
        Center(
            child: Text(
              textTitle,
              style:
              TextStyles.font28Weight600.copyWith(color: AppColors.textOnBack),
            )),
        SizedBox(
          width: 250.w,
          child: Center(
              child: Text(
                msg,
                style: TextStyles.font16Weight600.copyWith(color: AppColors.gray),
                textAlign: TextAlign.center,
              )),
        ),
      ],
    ),
  );
}