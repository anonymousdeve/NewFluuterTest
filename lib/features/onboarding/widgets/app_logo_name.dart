import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoAndName extends StatelessWidget {
  const AppLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 42.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
                color: AppColors.textOnScreen,
                borderRadius: BorderRadius.all(Radius.circular(36.w))),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset("assets/images/appLogo.png"),
            ),
          ),
          SizedBox(
            height: 16.w,
          ),
          Text(
            "Food for\nEveryone ",
            style: TextStyles.font65Weight800,
          )
        ],
      ),
    );
  }
}
