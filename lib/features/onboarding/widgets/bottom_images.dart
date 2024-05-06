import 'package:advanced_test/core/helpers/navigation_ext.dart';
import 'package:advanced_test/core/routing/routes.dart';
import 'package:advanced_test/core/thiming/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomImages extends StatelessWidget {
  const BottomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Stack(clipBehavior: Clip.none, children: [
        Transform.translate(
          offset: Offset(.495.sw, .08.sh),
          child: Transform.rotate(
            angle: 8 * pi / 180,
            child: SizedBox(
              width: .55.sw,
              child: Image.asset("assets/images/on_boarding_2.png"),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-(.12.sw), 0),
          child: Transform.rotate(
            angle: -4 * pi / 180,
            child: SizedBox(
              width: .7.sw,
              child: Image.asset("assets/images/on_boarding_1.png"),
            ),
          ),
        ),
        Positioned(
            child: Container(
          height: .8.sh,
          width: 1.sw,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.mainOrange,
                    // Colors.white
                    AppColors.mainOrange.withOpacity(.1),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [.5, .7])),
        )),
        Positioned(
            top: .48.sh,
            left: .1.sw,
            right: .1.sw,
            child: SizedBox(
              width: .8.sw,
              height: 64.h,
              child: ElevatedButton(
                onPressed: () => {
                  context.pushReplacementNamed(Routes.loginScreen)
                },
                child: const Text("Get Started"),
              ),
            ))
      ]),
    );
  }
}
