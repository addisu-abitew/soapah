import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_elevated_button.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/custom_text_theme.dart';
import '../../core/utils/image_constant.dart';
import '../../core/widgets/custom_image_view.dart';

class WeeklyPdfPage extends StatelessWidget {
  const WeeklyPdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 4.w,
                  backgroundColor: appTheme.black900,
                  child: Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(width: 3.w),
                Text(
                  'PDF Weekly Version',
                  style: CustomTextStyles.montserratBlackLarge800,
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.white900,
                  borderRadius: BorderRadius.circular(2.w),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 4.w),
                width: double.maxFinite,
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo,
                      height: 3.h,
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                    ),
                    Row(
                      children: [
                        Text(
                          'Weekly View',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'Date: 12-18: February, 2025',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        BatchCard(),
                        SizedBox(width: 2.w),
                        BatchCard(),
                        SizedBox(width: 2.w),
                        BatchCard(),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        BatchCard(),
                        SizedBox(width: 2.w),
                        BatchCard(),
                        SizedBox(width: 2.w),
                        BatchCard(),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(width: 2.w),
                        BatchCard(),
                        SizedBox(width: 2.w),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            CustomElevatedButton(text: 'Download'),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

class BatchCard extends StatelessWidget {
  const BatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.white900,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgSampleBatch,
              height: 6.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(2.w),
            ),
            SizedBox(height: 1.h),
            Text(
              'Batch Name Here',
              style: CustomTextStyles.montserratBlack800Bold,
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Text('Sunday', style: TextStyle(fontSize: 8)),
                Spacer(),
                Text('12/11/2025', style: TextStyle(fontSize: 8)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
