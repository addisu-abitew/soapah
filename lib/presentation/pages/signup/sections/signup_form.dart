import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import '../../../core/theme/custom_text_theme.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sign Up', style: CustomTextStyles.montserratBlackLarge900),
          SizedBox(height: 1.h),
          Text('Please enter your account details for signup.'),
          SizedBox(height: 3.h),
          CustomTextFormField(hintText: 'Email Address'),
          SizedBox(height: 1.5.h),
          CustomTextFormField(hintText: 'Password'),
          SizedBox(height: 1.5.h),
          CustomTextFormField(hintText: 'Confirm Password'),
          SizedBox(height: 3.h),
          CustomElevatedButton(onPressed: () {}, text: 'Sign In'),
        ],
      ),
    );
  }
}
