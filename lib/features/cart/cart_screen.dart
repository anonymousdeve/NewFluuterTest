import 'package:advanced_test/core/helpers/navigation_ext.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:advanced_test/core/widgets/empty_view.dart';
import 'package:advanced_test/domain/cart_item_module.dart';
import 'package:advanced_test/domain/food_item_module.dart';
import 'package:advanced_test/features/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  final Map<int, CartItemModule> items;

  CartScreen({super.key, required this.items}) {
    resetDruggingValue();
  }

  void resetDruggingValue() {
    items.forEach((key, value) {
      value.isDragged = false;
    });
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            color: AppColors.mainScreenColorDarker,
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
                      width: 50.w,
                      height: 50.h,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 175.w,
            top: 75.h,
            child: Center(
              child: Text(
                "Orders",
                style: TextStyles.font16Weight600
                    .copyWith(color: AppColors.textOnBack),
              ),
            ),
          ),
          if (widget.items.isEmpty)
            Stack(
              children: [
                messageImage("assets/svg/cart_screen_cart_icon.svg"),
                messageText("No orders yet",
                    "Hit the orange button down below to Create an order"),
              ],
            )
          else
            Positioned(
              top: 120.h,
              left: .25.sw,
              child: SizedBox(
                width: 1.sw - 100.w,
                height: 64.h,
                child: Row(
                  children: [
                    const Icon(Icons.swipe, color: AppColors.mainOrange),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "swipe on an item to do actions",
                      style: TextStyles.font14Weight400
                          .copyWith(color: AppColors.textOnBack),
                    )
                  ],
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 150.h, left: 25.w, right: 25.w),
            child: ListView.builder(
                itemCount: widget.items.values.length,
                itemBuilder: (context, index) {
                  CartItemModule item = widget.items.values.elementAt(index);
                  return GestureDetector(
                    onHorizontalDragEnd: (drag) {
                      if (drag.primaryVelocity == null) return;
                      if (drag.primaryVelocity! < 0) {
                        widget.resetDruggingValue();
                        item.isDragged = true;
                      } else {
                        item.isDragged = false;
                      }
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      height: 120.h,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            right: item.isDragged ? 130.w : 0,
                            child: SizedBox(
                              width: 1.sw - 50.w,
                              height: 120.h,
                              child: cartItem(
                                cartItem: item,
                                add: () {
                                  item.count = item.count + 1;
                                  setState(() {});
                                },
                                remove: () {
                                  if (item.count > 1) {
                                    item.count = item.count - 1;
                                  } else {
                                    widget.items.remove(
                                        widget.items.keys.elementAt(index));
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 31.h,
                            right: item.isDragged ? 12.w : -1.sw,
                            child: Visibility(
                              visible: item.isDragged,
                              child: Material(
                                color: Colors.transparent,
                                // Necessary for InkWell to work correctly
                                child: Ink(
                                  width: 48.w,
                                  height: 48.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(24.w),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(24.w),
                                    // Ensures ripple effect is circular
                                    splashColor: AppColors.mainScreenColorDarker,
                                    // Set your ripple color here
                                    onTap: () {
                                      FoodItemModule? result =
                                          foodItems.firstWhere(
                                        (firstItem) =>
                                            firstItem.id == item.item.id,
                                      );
                                      result.isLiked = !result.isLiked;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      item.item.isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 31.h,
                            right: item.isDragged ? 72.w : -1.sw,
                            child: Visibility(
                              visible: item.isDragged,
                              child: Material(
                                color: Colors.transparent,
                                // Necessary for InkWell to work correctly
                                child: Ink(
                                  width: 48.w,
                                  height: 48.w,

                                  decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(24.w),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(24.w),
                                    // Ensures ripple effect is circular
                                    splashColor: AppColors.mainScreenColorDarker,
                                    // Set your ripple color here
                                    onTap: () {
                                      widget.items.remove(
                                          widget.items.keys.elementAt(index));
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: 40.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: .1.sw),
              child: SizedBox(
                width: .8.sw,
                height: 72.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform login logic here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.mainOrange),
                  ),
                  child: Text(
                    widget.items.isEmpty ? 'Start Ordering' : 'Complete Order',
                    style: const TextStyle(
                        color: AppColors.textOnScreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

