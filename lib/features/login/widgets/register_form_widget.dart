import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool showPassword = false;
  bool showRePassword = false;

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
              hintText: 'User name',
            ),
            SizedBox(
              height: 12.h,
            ),
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              hintText: 'Email address',
            ),
            SizedBox(
              height: 12.h,
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
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.mainOrange,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password confirm';
                }
                return null;
              },
              hintText: 'Re-Password',
              isObscureText: showRePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showRePassword = !showRePassword;
                  });
                },
                child: Icon(
                  showRePassword ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.mainOrange,
                ),
              ),
            ),

            SizedBox(
              height: 104.h,
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
                  'Create New Account',
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
