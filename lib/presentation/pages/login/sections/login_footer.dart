import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import '../../../core/theme/custom_text_theme.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Don't have an account? "),
              TextSpan(
                text: "Sign up",
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
        SizedBox(height: 6.h),
        Text(
          '™© Serrenta Corporation and Robb Consulting Group Corporation',
          style: CustomTextStyles.montserratSmallBlack900,
        ),
      ],
    );
  }
}
