import 'package:advanced_test/core/helpers/const.dart';
import 'package:advanced_test/core/helpers/navigation_ext.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:advanced_test/domain/food_item_module.dart';
import 'package:advanced_test/features/item/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetails extends StatefulWidget {
  final FoodItemModule itemModule;

  const ItemDetails({super.key, required this.itemModule});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            color: AppColors.mainScreenColor,
          ),
          Positioned(
            left: 32.w,
            top: 72.h,
            child: SizedBox(
              width: .85.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 32.h,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.itemModule.isLiked = !widget.itemModule.isLiked;
                      });
                    },
                    child: SizedBox(
                      width: 32.w,
                      height: 32.h,
                      child: widget.itemModule.isLiked
                          ? const Icon(
                              Icons.favorite,
                              color: AppColors.mainOrange,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: AppColors.gray,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 120.h, child: ImageSlider(photos: widget.itemModule.photos)),
          Positioned(
              top: 365.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 1.sw,
                    child: Center(
                      child: Text(
                        widget.itemModule.name,
                        style: TextStyles.font28Weight600
                            .copyWith(color: AppColors.textOnBack),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: Center(
                      child: Text(
                        "${widget.itemModule.price} $CURRENCY",
                        style: TextStyles.font28Weight600
                            .copyWith(color: AppColors.mainOrange),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Text(
                      "Delivery info",
                      style: TextStyles.font22Weight600
                          .copyWith(color: AppColors.textOnBack),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Center(
                      child: SizedBox(
                        width: 1.sw-2*42.w,
                        child: Text(
                          maxLines: 2, // You can adjust the number of lines as needed
                          widget.itemModule.deliveryInfo,
                          style: TextStyles.font16Weight400
                              .copyWith(color: AppColors.gray),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Text(
                      "Return policy",
                      style: TextStyles.font22Weight600
                          .copyWith(color: AppColors.textOnBack),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Center(
                      child: SizedBox(
                        width: 1.sw-2*42.w,
                        child: Text(
                          maxLines: 3, // You can adjust the number of lines as needed
                          widget.itemModule.returnPolicy,
                          style: TextStyles.font16Weight400
                              .copyWith(color: AppColors.gray),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: .1.sw),
                    child: SizedBox(
                      width: .8.sw,
                      height: 64.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform login logic here

                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.mainOrange)),
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(
                              color: AppColors.textOnScreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                ],
              ))
        ],
      ),
    );
  }
}
