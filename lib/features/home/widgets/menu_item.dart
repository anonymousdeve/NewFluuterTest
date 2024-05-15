import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget menuItem(
    String title, String icon, bool isActive, VoidCallback onClick) {
  return GestureDetector(
    onTap: (){
      onClick();
    },
    child: Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          height: 48.h,
          width: isActive ? 0.8.sw : 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.mainScreenColorDarker,
                  borderRadius: BorderRadius.all(Radius.circular(8.h))),
            ),
          ),
        ),
        Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: 32.w,
                height: 32.w,
                child: SvgPicture.asset(icon,
                    colorFilter: ColorFilter.mode(
                        isActive
                            ? AppColors.mainOrange
                            : AppColors.mainScreenColor,
                        BlendMode.srcIn)),
              ),
              title: Text(
                title,
                style: TextStyles.font16Weight400.copyWith(
                    color:
                        isActive ? AppColors.mainOrange : AppColors.textOnScreen,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Divider(
                height: 1.h,
                color: AppColors.gray,
              ),
            )
          ],
        ),
        SizedBox(
          height: 56.h,
        )
      ],
    ),
  );
}
