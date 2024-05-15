import 'dart:math';

import 'package:advanced_test/core/helpers/static_data.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class FoodItem extends StatelessWidget {
  final int index;
  const FoodItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 250.h,
          margin:
          EdgeInsets.symmetric(horizontal: 8.w),
          child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(top: 70.h),
                  child: Container(
                    height: 250.h,
                    width: 210.w,
                    decoration: BoxDecoration(
                        color: AppColors
                            .mainScreenColor,
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                30.h))),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 23.w),
                      child: Card(
                        elevation: 8.h,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              82),
                        ),
                        child: Container(
                          width: 154.w,
                          height: 154.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors
                                    .mainScreenColorDarker1),
                            image: DecorationImage(
                                image: AssetImage(
                                    images[index]),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Name ${index + 1}  Test",
                      textAlign: TextAlign.center,
                      style: TextStyles
                          .font22Weight600
                          .copyWith(
                        color: AppColors.textOnBack,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "${(Random().nextDouble() * 200).toStringAsFixed(2)}  Le",
                      textAlign: TextAlign.center,
                      style: TextStyles
                          .font16Weight600
                          .copyWith(
                        color: AppColors.mainOrange,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w),
                      child: SizedBox(
                        width: 180.w,
                        child: Text(
                          loremIpsum(words: 4),
                          textAlign:
                          TextAlign.center,
                          style: TextStyles
                              .font14Weight400
                              .copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
