import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_checkbox.dart';
import 'package:soapah/presentation/core/widgets/custom_dropdown.dart';
import 'package:soapah/presentation/core/widgets/custom_elevated_button.dart';
import 'package:soapah/presentation/core/widgets/custom_text_form_field.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/custom_text_theme.dart';
import '../../core/utils/image_constant.dart';
import '../../core/widgets/custom_image_view.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 6.h,
                margin: EdgeInsets.symmetric(vertical: 2.h),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 4.w,
                    backgroundColor: appTheme.black900,
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Calculator',
                    style: CustomTextStyles.montserratBlackLarge800,
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Container(
                width: 100.w,
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
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recipe Name',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      hintText: 'Recipe Name',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Soap Type',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Solid Soap',
                    ),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Liquid Soap',
                    ),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Mixed Soap',
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.5.h),
                      child: Divider(height: 3),
                    ),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Master Batch',
                      value: true,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Recipe Measurements',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomCheckboxButton(onChange: (val) {}, text: 'Ounces'),
                    CustomCheckboxButton(onChange: (val) {}, text: 'Grams'),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Percentages',
                    ),
                    CustomCheckboxButton(
                      onChange: (val) {},
                      text: 'Total Oil Weight',
                      value: true,
                    ),
                    Row(
                      children: [
                        Opacity(
                          opacity: 0,
                          child: CustomCheckboxButton(onChange: (val) {}),
                        ),
                        Text(
                          '1000',
                          style: CustomTextStyles.montserratBlack900Regular6_1,
                        ),
                      ],
                    ),
                    CustomCheckboxButton(onChange: (val) {}, text: 'Mold Size'),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Width',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomTextFormField(
                            hintText: 'in inches',
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Height',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomTextFormField(
                            hintText: 'in inches',
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Length',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomTextFormField(
                            hintText: 'in inches',
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Liquid',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomDropdown(
                            hintText: 'Lye Concentration',
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'Amount',
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Superfat',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      hintText: '5%',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          'Oils',
                          style: CustomTextStyles.montserratBlack900Bold,
                        ),
                        Spacer(),
                        CustomElevatedButton(
                          text: 'Add Oils',
                          width: 25.w,
                          height: 4.h,
                          buttonTextStyle:
                              CustomTextStyles.montserratWhite800LargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(text: 'Name', isBold: true),
                            TableCell(text: '%', isBold: true),
                            TableCell(text: 'oz', isBold: true),
                            TableCell(text: 'gr', isBold: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Tallow, beef'),
                            TableCell(text: '60'),
                            TableCell(text: '212'),
                            TableCell(text: '600'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Rice Bran Oil'),
                            TableCell(text: '30'),
                            TableCell(text: '10.6'),
                            TableCell(text: '300'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Castor Oil'),
                            TableCell(text: '10'),
                            TableCell(text: '3.5'),
                            TableCell(text: '100'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Total', isBold: true),
                            TableCell(text: '10', isBold: true),
                            TableCell(text: '3.5', isBold: true),
                            TableCell(text: '100', isBold: true),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(),
                    Row(
                      children: [
                        Text(
                          'Additives',
                          style: CustomTextStyles.montserratBlack900Bold,
                        ),
                        Spacer(),
                        CustomElevatedButton(
                          text: 'Add Additives',
                          width: 35.w,
                          height: 4.h,
                          buttonTextStyle:
                              CustomTextStyles.montserratWhite800LargeBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(text: 'Name', isBold: true),
                            TableCell(text: '%', isBold: true),
                            TableCell(text: 'oz', isBold: true),
                            TableCell(text: 'gr', isBold: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Sodium Lactate'),
                            TableCell(text: '60'),
                            TableCell(text: '212'),
                            TableCell(text: '600'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Sugar'),
                            TableCell(text: '30'),
                            TableCell(text: '10.6'),
                            TableCell(text: '300'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(text: 'Total', isBold: true),
                            TableCell(text: '10', isBold: true),
                            TableCell(text: '3.5', isBold: true),
                            TableCell(text: '100', isBold: true),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Fragrance Calculator',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      hintText: '3%',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Tags',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      hintText: 'Tags',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Notes',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      hintText: 'Notes',
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Images',
                      style: CustomTextStyles.montserratBlack900Bold,
                    ),
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
                                    style: CustomTextStyles
                                        .montserratBlack900Medium4
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' or drag and drop',
                                    style:
                                        CustomTextStyles
                                            .montserratBlack900Medium4,
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
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              CustomElevatedButton(text: 'Check Results'),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  final String text;
  final bool isBold;
  const TableCell({required this.text, this.isBold = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: appTheme.gray100)),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: CustomTextStyles.montserratBlack900Regular6_1.copyWith(
          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          fontSize: isBold ? 14 : 13,
        ),
      ),
    );
  }
}
