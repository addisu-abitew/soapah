import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/theme/app_theme.dart';
import 'package:soapah/presentation/core/theme/custom_text_theme.dart';
import 'package:soapah/presentation/core/utils/image_constant.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_image_view.dart';

class WeekView extends StatelessWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Date: 12 - 18 February 2025'),
            Spacer(),
            Icon(Icons.arrow_back_ios_rounded, size: 16),
            SizedBox(width: 2.w),
            Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
        SizedBox(height: 3.h),
        Row(children: [BatchCard(), SizedBox(width: 4.w), BatchCard()]),
        SizedBox(height: 2.h),
        Row(children: [BatchCard(), SizedBox(width: 4.w), BatchCard()]),
        SizedBox(height: 2.h),
        Row(children: [BatchCard(), SizedBox(width: 4.w), BatchCard()]),
        SizedBox(height: 2.h),
        Row(children: [BatchCard(), SizedBox(width: 4.w), Spacer()]),
      ],
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
              height: 10.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(2.w),
            ),
            SizedBox(height: 1.h),
            Text(
              'Batch Name Here',
              style: CustomTextStyles.montserratBlack900Bold,
            ),
            SizedBox(height: 1.h),
            Row(children: [Text('Sunday'), Spacer(), Text('12 Feb 2025')]),
          ],
        ),
      ),
    );
  }
}
