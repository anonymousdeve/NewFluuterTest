import 'package:advanced_test/core/helpers/const.dart';
import 'package:advanced_test/core/helpers/list.dart';
import 'package:advanced_test/core/helpers/navigation_ext.dart';
import 'package:advanced_test/core/routing/routes.dart';
import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/widgets/empty_view.dart';
import 'package:advanced_test/domain/food_item_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import '../../core/theming/styles.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var newIndex=0;
    return Scaffold(
      backgroundColor: AppColors.mainScreenColorDarker,
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
                "Favorites",
                style: TextStyles.font16Weight600
                    .copyWith(color: AppColors.textOnBack),
              ),
            ),
          ),
          if (foodItems.filter((item) => item.isLiked).isEmpty)
            Stack(
              children: [
                messageImage("assets/svg/favorites.svg"),
                messageText("No favorites item yet",
                    "go and add some items to favorites to show them here."),
              ],
            )
          else
            Padding(
              padding: EdgeInsets.only(top: 120.h, left: 25.w, right: 25.w),
              child: ListView.builder(
                itemCount: (foodItems.filter((item) => item.isLiked).length / 2)
                    .round(),
                itemBuilder: (BuildContext context, int sectionIndex) {
                  newIndex = newIndex + 2;
                  return Row(children: [
                    itemView(context, newIndex - 2),
                    itemView(context, newIndex - 1)
                  ]);
                },
              ),
            ),
        ],
      ),
    );
  }

}

Widget itemView(context, sectionIndex) {

  if ((sectionIndex) >= foodItems.filter((item) => item.isLiked).length) {
    return const SizedBox();
  }
  return sectionIndex % 2 != 0
      ? Padding(
          padding: EdgeInsets.only(top: 60.h, left: 8.w, right: 8.w),
          child: SizedBox(
            width: .4.sw,
            child: favoriteItem(context,
                foodItems.filter((item) => item.isLiked)[sectionIndex]),
          ),
        )
      : Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: SizedBox(
            width: .4.sw,
            height: 250.h,
            child: favoriteItem(context,
                foodItems.filter((item) => item.isLiked)[sectionIndex]),
          ),
        );
}

Widget favoriteItem(BuildContext context, FoodItemModule item) {
  final size = MediaQuery.of(context).size;

  return Container(
    height: 240.h,
    margin: EdgeInsets.symmetric(horizontal: .006 * size.width),
    child: GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.itemDetails, arguments: item);
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: .14 * size.width),
              height: .5 * size.height,
              width: .5 * size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gray,
                      blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0.0, 1.1)
                    ),                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.h),
                  )),
            ),
            Positioned(
              top: 8.h,
              left: .07 * size.width,
              right: .07 * size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: .01 * size.width),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(82),
                  ),
                  child: Container(
                    width: .20 * size.width,
                    height: .20 * size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.mainScreenColorDarker1),
                      image: DecorationImage(
                          image: AssetImage(item.photos.first),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyles.font22Weight600.copyWith(
                    color: AppColors.textOnBack,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "${item.price} $CURRENCY",
                  textAlign: TextAlign.center,
                  style: TextStyles.font16Weight600.copyWith(
                    color: AppColors.mainOrange,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: SizedBox(
                    width: 180.w,
                    child: Text(
                      loremIpsum(words: 4),
                      textAlign: TextAlign.center,
                      style: TextStyles.font14Weight400.copyWith(
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
  );
}
