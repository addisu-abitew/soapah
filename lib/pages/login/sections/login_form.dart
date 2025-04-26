import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/providers/auth_provider.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
            Text(
              'Welcome Back 👋',
              style: CustomTextStyles.montserratBlackLarge900,
            ),
            SizedBox(height: 1.h),
            Text('Enter your email address and password to sign in.'),
            SizedBox(height: 3.h),
            CustomTextFormField(
              hintText: 'Email Address',
              controller: context.read<AuthProvider>().emailController,
              validator: (value) => context.read<AuthProvider>().emailError,
              onChanged:
                  (value) => context.read<AuthProvider>().validateEmail(),
            ),
            SizedBox(height: 1.5.h),
            CustomTextFormField(
              hintText: 'Password',
              controller: context.read<AuthProvider>().passwordController,
              validator: (value) => context.read<AuthProvider>().passwordError,
              onChanged:
                  (value) => context.read<AuthProvider>().validatePassword(),
              obscureText: context.watch<AuthProvider>().obscurePasswords,
              suffix: GestureDetector(
                onTap:
                    () => context.read<AuthProvider>().toggleObscurePassword(),
                child: Icon(
                  context.read<AuthProvider>().obscurePasswords
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: appTheme.gray700,
                ),
              ),
              suffixConstraints: BoxConstraints(maxWidth: 10.w, minWidth: 10.w),
            ),
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
            CustomElevatedButton(
              onPressed: () => context.read<AuthProvider>().signIn(),
              text: 'Sign In',
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
