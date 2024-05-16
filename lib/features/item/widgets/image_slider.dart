import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatefulWidget {
  final List<String> photos;

  const ImageSlider({super.key, required this.photos});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late final PageController pageController;
  int pageNo = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          width: 1.sw,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (ctx, child) {
                  return child!;
                },
                child: SizedBox(
                  width: 1.sw,
                  child: Image.asset(widget.photos[index],fit: BoxFit.contain,),
                ),
              );
            },
            itemCount: widget.photos.length,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.photos.length,
            (index) => GestureDetector(
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal:  4.w),
                child: Icon(
                  Icons.circle,
                  size: pageNo == index ? 16.w:12.w ,
                  color:
                      pageNo == index ? AppColors.mainOrange : AppColors.gray,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
