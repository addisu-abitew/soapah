import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soapah/router/app_routes.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../theme/custom_text_theme.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pushReplacement(AppRoutes.login),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Already have an account? "),
                TextSpan(
                  text: "Sign in",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    decorationColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          '™© Serrenta Corporation and Robb Consulting Group Corporation',
          style: CustomTextStyles.montserratSmallBlack900,
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
