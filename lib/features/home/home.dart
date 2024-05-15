import 'dart:math';

import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    images.shuffle();
    return Center(
      child: Container(
        color: AppColors.mainScreenColorDarker1,
        height: 1.sh,
        width: 1.sw,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 130.h, left: 32.w),
                  child: Text(
                    "Delicious\nfood for you",
                    style: TextStyles.font65Weight800
                        .copyWith(fontSize: 34, color: AppColors.textOnBack),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: .08.sw, vertical: 30.h),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      // Placeholder text
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 32.w, right: 10.w),
                        child: const Icon(Icons.search),
                      ),
                      // Icon before the input field
                      focusColor: AppColors.textOnScreen.withAlpha(0),
                      fillColor: AppColors.gray.withAlpha(15),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.h),
                          ),
                          borderSide: BorderSide(
                              color: AppColors.textOnScreen.withAlpha(0))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.h),
                          ),
                          borderSide: BorderSide(
                              color: AppColors.textOnScreen.withAlpha(0))),
                      // Border around the input field
                      // You can customize further properties such as fillColor, filled, contentPadding, etc. as needed
                    ),
                    onChanged: (value) {
                      // Handle onChanged event here
                      // You can use the value entered by the user for searching/filtering
                    },
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 32.w,
                  ),
                  child: SizedBox(
                      width: double.infinity,
                      height: 64.h,
                      // Using ListView.builder
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPos = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "${categories[index]}",
                                    style: TextStyles.font16Weight400.copyWith(
                                      color: selectedPos == index
                                          ? AppColors.mainOrange
                                          : AppColors.textOnBack.withAlpha(100),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Container(
                                    height: 3.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1.h)),
                                        color: selectedPos == index
                                            ? AppColors.mainOrange
                                            : AppColors.mainScreenColorDarker1),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 32.w,
                  ),
                  child: SizedBox(
                      width: double.infinity,
                      height: 320.h,
                      // Using ListView.builder
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext ctx, index) {
                          return index < 7
                              ? Container(
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
                                                      image: AssetImage(images[index]),
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
                                            "${ (Random().nextDouble()*200).toStringAsFixed(2)}  Le",
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
                                            padding:  EdgeInsets.only(left: 12.w,right: 12.w),
                                            child: SizedBox(
                                              width: 180.w,
                                              child: Text(
                                                loremIpsum(words: 4),
                                                textAlign: TextAlign.center,
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
                          )
                              : GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color:
                                      AppColors.mainScreenColorDarker,
                                      borderRadius:
                                      BorderRadius.circular(8.w)),
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 6.w),
                                  child: Center(
                                    child: Text(
                                      "See More",
                                      style: TextStyles.font14Weight400
                                          .copyWith(
                                          color: AppColors.mainOrange),
                                    ),
                                  )));
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List mainCat = [
  "Foods",
  "Drinks",
  "Snacks",
  "Fast Food",
  "Fish",
  "Chicken",
  "Beef"
];


List images = List.generate(7, (index) => "assets/images/foodImage$index.png");
final List categories =
List.generate(10, (index) => mainCat[Random().nextInt(mainCat.length)]);

/*
*
* */
