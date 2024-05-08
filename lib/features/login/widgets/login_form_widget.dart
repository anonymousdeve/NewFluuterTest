import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 32.h),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              hintText: 'Email address',
            ),
            SizedBox(
              height: 64.h,
            ),
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              hintText: 'Password',
              isObscureText: showPassword,
              suffixIcon: GestureDetector(onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
                child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,color: AppColors.mainOrange,),),
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
