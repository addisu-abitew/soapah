import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/theme/app_theme.dart';
import 'package:soapah/presentation/core/theme/custom_text_theme.dart';
import 'package:soapah/presentation/core/utils/image_constant.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_image_view.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: 100.w,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 6.h,
                margin: EdgeInsets.symmetric(vertical: 2.h),
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgCalculator,
                    text: 'Calculator',
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgRecipes,
                    text: 'Recipes',
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(imagePath: ImageConstant.imgBatch, text: 'Batch'),
                  MenuItem(
                    imagePath: ImageConstant.imgInventory,
                    text: 'Inventory',
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgCalendar,
                    text: 'Calendar',
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgLearningCenter,
                    text: 'Learning Center',
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgSoapahForum,
                    text: 'Soapah Forum',
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgUserGuide,
                    text: 'User Guide',
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgAccount,
                    text: 'Account',
                  ),
                  MenuItem(imagePath: ImageConstant.imgInfo, text: 'About Us'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;
  const MenuItem({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 15.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appTheme.white900,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 6.w,
              child: CustomImageView(
                imagePath: imagePath,
                height: 6.w,
                width: 6.w,
              ),
            ),
            SizedBox(height: 1.h),
            Text(text, style: CustomTextStyles.sFProBlackSmall),
          ],
        ),
      ),
    );
  }
}
