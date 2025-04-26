import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soapah/router/app_routes.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/theme/custom_text_theme.dart';
import 'package:soapah/utils/image_constant.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_image_view.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

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
                    onTap: () => context.push(AppRoutes.calculator),
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgRecipes,
                    text: 'Calendar',
                    onTap: () => context.push(AppRoutes.calendar),
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgBatch,
                    text: 'Account',
                    onTap: () => context.push(AppRoutes.account),
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgInventory,
                    text: 'Inventory',
                    onTap: () => context.push(AppRoutes.inventory),
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgCalendar,
                    text: 'Recipe',
                    onTap: () => context.push(AppRoutes.recipes),
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgLearningCenter,
                    text: 'Learning Center',
                    onTap: () => context.push(AppRoutes.learningCenter),
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgSoapahForum,
                    text: 'Soapah Forum',
                    onTap: () => context.push(AppRoutes.soapahForum),
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgUserGuide,
                    text: 'User Guide',
                    onTap: () => context.push(AppRoutes.userGuide),
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItem(
                    imagePath: ImageConstant.imgAccount,
                    text: 'Batch',
                    onTap: () => context.push(AppRoutes.batch),
                  ),
                  MenuItem(
                    imagePath: ImageConstant.imgInfo,
                    text: 'About Us',
                    onTap: () => context.push(AppRoutes.aboutUs),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
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
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
