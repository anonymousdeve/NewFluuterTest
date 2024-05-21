import 'package:advanced_test/core/helpers/const.dart';
import 'package:advanced_test/core/helpers/static_data.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:advanced_test/domain/cart_item_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cartItem(
    {required CartItemModule cartItem,
    required VoidCallback add,
    required VoidCallback remove}) {
  final item = cartItem.item;
  return Container(
    decoration: BoxDecoration(
      color: AppColors.mainScreenColor,
      borderRadius: BorderRadius.circular(20.w),
      boxShadow: const [
        BoxShadow(
          color: AppColors.gray,
          blurRadius: .5,
        ),
      ],
    ),
    child: Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Container(
                width: 85.w,
                height: 85.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                  image: DecorationImage(
                      image: AssetImage(item.photos.first.isNotEmpty
                          ? item.photos.first
                          : images.first),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyles.font16Weight600
                        .copyWith(color: AppColors.textOnBack),
                  ),
                  Text(
                    "${item.price} $CURRENCY",
                    style: TextStyles.font14Weight600
                        .copyWith(color: AppColors.mainOrange),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 12.h,
          right: 12.w,
          child: Container(
              height: 24.h,
              width: 72.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.h),
                  color: AppColors.mainOrange),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 21.w,
                      child: GestureDetector(
                        onTap: () {
                          add();
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.textOnScreen,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 21.w,
                      child: Text(
                        "${cartItem.count}",
                        textAlign: TextAlign.center,
                        style: TextStyles.font16Weight400,
                      ),
                    ),
                    SizedBox(
                      width: 21.w,
                      child: GestureDetector(
                        onTap: () {
                          remove();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.textOnScreen,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    ),
  );
}
