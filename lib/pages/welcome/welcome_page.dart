import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soapah/router/app_routes.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/image_constant.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_image_view.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

import '../../providers/auth_provider.dart';
import '../../theme/custom_text_theme.dart';
import '../../widgets/custom_elevated_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<AuthProvider>().authenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(AppRoutes.home);
      });
    }

    final errorMessage = context.watch<AuthProvider>().generalAuthError;
    if (errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      });
    }

    return SafeScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomImageView(
              imagePath: ImageConstant.imgSplashBg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          Column(
            children: [
              SizedBox(height: 30.h, width: 100.w),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                width: 80.w,
                color: appTheme.white900,
              ),
              Spacer(),
              CustomElevatedButton(
                onPressed: () => context.push(AppRoutes.signup),
                text: 'Sign Up',
                margin: EdgeInsets.symmetric(horizontal: 5.w),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                onPressed: () => context.push(AppRoutes.login),
                buttonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appTheme.gray650),
                ),
                text: 'Sign In',
                margin: EdgeInsets.symmetric(horizontal: 5.w),
              ),
              SizedBox(height: 2.h),
              Text(
                'Or continue with',
                style: CustomTextStyles.montserratSmallWhite900,
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    imagePath: ImageConstant.imgGoogle,
                    onPressed:
                        () => context.read<AuthProvider>().continueWithGoogle(),
                  ),
                  SizedBox(width: 5.w),
                  SocialIcon(
                    imagePath: ImageConstant.imgApple,
                    onPressed:
                        () => context.read<AuthProvider>().continueWithApple(),
                  ),
                  SizedBox(width: 5.w),
                  SocialIcon(
                    imagePath: ImageConstant.imgFacebook,
                    onPressed:
                        () =>
                            context.read<AuthProvider>().continueWithFacebook(),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'By signing in you are accepting our Terms and Conditions and Privacy Policy',
                style: CustomTextStyles.montserratSmallWhite900,
              ),
              SizedBox(height: 6.h),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;
  const SocialIcon({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 6.w,
        backgroundColor: appTheme.white900,
        child: CustomImageView(imagePath: imagePath, height: 5.w, width: 5.w),
      ),
    );
  }
}
