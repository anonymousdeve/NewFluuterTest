import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 32.h),
      child:  Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 64.h,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(labelText: 'Password',),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Forgot passcode?",
                style: TextStyle(
                    color: AppColors.mainOrange,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150.h,
              ),
              SizedBox(
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
                    'Login',
                    style: TextStyle(
                        color: AppColors.textOnScreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
