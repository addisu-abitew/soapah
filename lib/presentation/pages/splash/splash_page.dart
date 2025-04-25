import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/theme/app_theme.dart';
import 'package:soapah/presentation/core/utils/image_constant.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_image_view.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';

import '../../core/theme/custom_text_theme.dart';
import '../../core/widgets/custom_elevated_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                text: 'Sign Up',
                margin: EdgeInsets.symmetric(horizontal: 5.w),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                onPressed: () {},
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
                  SocialIcon(imagePath: ImageConstant.imgApple),
                  SizedBox(width: 5.w),
                  SocialIcon(imagePath: ImageConstant.imgFacebook),
                  SizedBox(width: 5.w),
                  SocialIcon(imagePath: ImageConstant.imgGoogle),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'By signing in you are accepting our Terms and Conditions and Privacy Policy',
                style: CustomTextStyles.montserratSmallWhite900,
              ),
              SizedBox(height: 1.h),
              Text(
                '™© Serrenta Corporation and Robb Consulting Group Corporation',
                style: CustomTextStyles.montserratSmallWhite900,
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String imagePath;
  const SocialIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 6.w,
      backgroundColor: appTheme.white900,
      child: CustomImageView(imagePath: imagePath, height: 5.w, width: 5.w),
    );
  }
}
