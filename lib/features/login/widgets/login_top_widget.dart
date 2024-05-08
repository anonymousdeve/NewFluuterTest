import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLoginWidget extends StatefulWidget {
  final Function(bool isLogin) callBack;

  const TopLoginWidget({super.key, required this.callBack});

  @override
  State<TopLoginWidget> createState() => _TopLoginWidgetState();
}

class _TopLoginWidgetState extends State<TopLoginWidget> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: .38.sh,
            width: 1.sw,
            decoration: BoxDecoration(
                color: AppColors.mainScreenColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(42.w),
                  bottomRight: Radius.circular(42.w),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      color: AppColors.textOnBack.withOpacity(.15),
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0.0, 1.1))
                ]),
            child: Center(
              child: SizedBox(
                width: 98.w,
                height: 98.h,
                child: Image.asset("assets/images/appLogo.png"),
              ),
            ),
          ),
        ),
        Positioned(
            top: .35.sh,
            child: SizedBox(
              width: 1.sw,
              child: Row(
                children: [
                  SizedBox(
                    width: .12.sw,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isLogin) {
                          isLogin = true;
                        }
                        widget.callBack(isLogin);
                      });
                    },
                    child: SizedBox(
                      width: .3.sw,
                      child: Column(
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.textOnBack,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            width: .3.sw,
                            height: 3.h,
                            color: isLogin
                                ? AppColors.mainOrange
                                : AppColors.mainScreenColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: .1.sw,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isLogin) {
                          isLogin = false;
                        }
                        widget.callBack(isLogin);
                      });
                    },
                    child: SizedBox(
                      width: .4.sw,
                      child: Column(
                        children: [
                          const Text(
                            "Sign-up",
                            style: TextStyle(
                                color: AppColors.textOnBack,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            width: .3.sw,
                            height: 3.h,
                            color: !isLogin
                                ? AppColors.mainOrange
                                : AppColors.mainScreenColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
