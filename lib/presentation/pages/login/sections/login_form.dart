import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import '../../../core/theme/custom_text_theme.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back 👋',
            style: CustomTextStyles.montserratBlackLarge900,
          ),
          SizedBox(height: 1.h),
          Text('Enter your email address and password to sign in.'),
          SizedBox(height: 3.h),
          CustomTextFormField(hintText: 'Email Address'),
          SizedBox(height: 1.5.h),
          CustomTextFormField(hintText: 'Password'),
          SizedBox(height: 1.5.h),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          CustomElevatedButton(onPressed: () {}, text: 'Sign In'),
        ],
      ),
    );
  }
}
