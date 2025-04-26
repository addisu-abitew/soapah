import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/providers/auth_provider.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../theme/custom_text_theme.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Form(
        key: context.read<AuthProvider>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up', style: CustomTextStyles.montserratBlackLarge900),
            SizedBox(height: 1.h),
            Text('Please enter your account details for signup.'),
            SizedBox(height: 3.h),
            CustomTextFormField(
              hintText: 'Email Address',
              controller: context.read<AuthProvider>().emailController,
              validator: (value) => context.read<AuthProvider>().emailError,
              onChanged:
                  (value) => context.read<AuthProvider>().validateEmail(),
            ),
            SizedBox(height: 1.5.h),
            PasswordField(
              hintText: 'Password',
              controller: context.read<AuthProvider>().passwordController,
              validator: (value) => context.read<AuthProvider>().passwordError,
              onChanged:
                  (value) => context.read<AuthProvider>().validatePassword(),
            ),
            SizedBox(height: 1.5.h),
            PasswordField(
              hintText: 'Confirm Password',
              controller:
                  context.read<AuthProvider>().confirmPasswordController,
              validator:
                  (value) => context.read<AuthProvider>().confirmPasswordError,
              onChanged:
                  (value) =>
                      context.read<AuthProvider>().validateConfirmPassword(),
            ),
            SizedBox(height: 3.h),
            CustomElevatedButton(
              onPressed: () => context.read<AuthProvider>().signUp(),
              text: 'Sign Up',
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(appTheme.gray650),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const PasswordField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: context.read<AuthProvider>().obscurePasswords,
      suffix: GestureDetector(
        onTap: () => context.read<AuthProvider>().toggleObscurePassword(),
        child: Icon(
          context.read<AuthProvider>().obscurePasswords
              ? Icons.visibility
              : Icons.visibility_off,
          color: appTheme.gray700,
        ),
      ),
      suffixConstraints: BoxConstraints(maxWidth: 10.w, minWidth: 10.w),
    );
  }
}
