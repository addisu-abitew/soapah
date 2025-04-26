import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_elevated_button.dart';
import 'package:soapah/widgets/custom_outlined_button.dart';
import 'package:soapah/widgets/custom_text_form_field.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

import '../../theme/app_theme.dart';
import '../../theme/custom_text_theme.dart';
import '../../utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class DateDetailsPage extends StatelessWidget {
  const DateDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              HeaderLogo(),
              NavigationHeader(title: 'Date'),
              SizedBox(height: 3.h),
              BatchCard(),
              SizedBox(height: 2.h),
              BatchForm(),
              SizedBox(height: 2.h),
              Container(
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
                padding: EdgeInsets.all(3.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Curing Tracker',
                          style: CustomTextStyles.montserratBlack900Bold,
                        ),
                        Spacer(),
                        CustomElevatedButton(
                          text: 'Add Weight',
                          width: 35.w,
                          height: 4.h,
                          buttonTextStyle:
                              CustomTextStyles.montserratWhite800LargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: CustomTextStyles.montserratBlack900Bold,
                              ),
                              CustomTextFormField(
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                hintText: '12/12/2024',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weight in gram',
                                style: CustomTextStyles.montserratBlack900Bold,
                              ),
                              CustomTextFormField(
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                hintText: '10 g',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

class BatchForm extends StatelessWidget {
  const BatchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomElevatedButton(
            text: 'Planning for',
            height: 4.h,
            buttonTextStyle: CustomTextStyles.montserratWhite800LargeBold,
          ),
          SizedBox(height: 2.h),
          Text('Soap Name', style: CustomTextStyles.montserratBlack900Bold),
          SizedBox(height: 1.h),
          CustomTextFormField(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            hintText: 'Soap Name',
          ),
          SizedBox(height: 2.h),
          Text('Images', style: CustomTextStyles.montserratBlack900Bold),
          SizedBox(height: 1.h),
          DottedBorder(
            color: appTheme.gray200,
            dashPattern: [8, 6],
            borderType: BorderType.RRect,
            radius: Radius.circular(2.w),
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Click to upload',
                          style: CustomTextStyles.montserratBlack900Medium4
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        TextSpan(
                          text: ' or drag and drop',
                          style: CustomTextStyles.montserratBlack900Medium4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'SVG, PNG, JPG or GIF (max. 800x400px)',
                    style: CustomTextStyles.montserratBlack900Medium4,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          CustomOutlinedButton(text: 'Add more', height: 4.h),
        ],
      ),
    );
  }
}

class BatchCard extends StatelessWidget {
  const BatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 20.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(2.w),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Batch Name:'),
                  Text('Batch Number:'),
                  Text('Created Date:'),
                  Text('Curing Date:'),
                ],
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Batch Name Here'),
                  Text('1234567'),
                  Text('12 Feb 2025'),
                  Text('12 Feb 2025'),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
