import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/features/login/widgets/login_form_widget.dart';
import 'package:advanced_test/features/login/widgets/login_top_widget.dart';
import 'package:advanced_test/features/login/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainScreenColorDarker,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopLoginWidget(callBack: (isLoginValue) {
              setState(() {
                isLogin = isLoginValue;
              });
            }),
            SizedBox(
              height: 20.h,
            ),
            isLogin ? const LoginFormWidget() : const RegisterFormWidget()
          ],
        ),
      ),
    );
  }
}
