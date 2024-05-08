import 'package:advanced_test/core/theming/app_colors.dart';
import 'package:advanced_test/features/login/widgets/login_form_widget.dart';
import 'package:advanced_test/features/login/widgets/login_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainScreenColorDarker,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopLoginWidget(),
            SizedBox(
              height: 20.h,
            ),
            const LoginFormWidget()
          ],
        ),
      ),
    );
  }
}
