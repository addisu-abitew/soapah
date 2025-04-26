import 'package:flutter/material.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_elevated_button.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

import '../../theme/app_theme.dart';
import '../../theme/custom_text_theme.dart';
import '../../utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class MonthlyPdfPage extends StatelessWidget {
  const MonthlyPdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            NavigationHeader(title: 'PDF Monthly Version'),
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
                          'Monthly View',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'March 2021',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            CalendarHeader(text: 'Sun'),
                            CalendarHeader(text: 'Mon'),
                            CalendarHeader(text: 'Tue'),
                            CalendarHeader(text: 'Wed'),
                            CalendarHeader(text: 'Thu'),
                            CalendarHeader(text: 'Fri'),
                            CalendarHeader(text: 'Sat'),
                          ],
                        ),
                        TableRow(
                          children: List.generate(7, (index) {
                            final date = (index + 27) % 31 + 1;
                            final isActive = date < 28;
                            return DayView(
                              date: date,
                              active: isActive,
                              isLastCell: date == 3,
                            );
                          }),
                        ),
                        TableRow(
                          children: List.generate(7, (index) {
                            final date = (index + 4) % 32;
                            return DayView(
                              date: date,
                              active: true,
                              isLastCell: date == 10,
                            );
                          }),
                        ),
                        TableRow(
                          children: List.generate(7, (index) {
                            final date = (index + 11) % 32;
                            return DayView(
                              date: date,
                              active: true,
                              isLastCell: date == 17,
                            );
                          }),
                        ),
                        TableRow(
                          children: List.generate(7, (index) {
                            final date = (index + 18) % 32;
                            return DayView(
                              date: date,
                              active: true,
                              isLastCell: date == 24,
                            );
                          }),
                        ),
                        TableRow(
                          children: List.generate(7, (index) {
                            final date = (index + 25) % 32;
                            return DayView(
                              date: date,
                              active: true,
                              isLastCell: date == 31,
                              isBottom: true,
                            );
                          }),
                        ),
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

class CalendarHeader extends StatelessWidget {
  final String text;
  const CalendarHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      child: Text(text, style: CustomTextStyles.montserratSmallBlack900),
    );
  }
}

class DayView extends StatelessWidget {
  final int date;
  final bool active;
  final bool isLastCell;
  final bool isBottom;
  const DayView({
    super.key,
    required this.date,
    required this.active,
    required this.isLastCell,
    this.isBottom = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: appTheme.gray200),
          bottom:
              isBottom ? BorderSide(color: appTheme.gray200) : BorderSide.none,
          left: BorderSide(color: appTheme.gray200),
          right: BorderSide(
            color: isLastCell ? appTheme.gray200 : Colors.transparent,
          ),
        ),
      ),
      height: 10.h,
      child: Text(
        '$date',
        style: CustomTextStyles.montserratSmallBlack900.copyWith(
          color: active ? appTheme.black900 : appTheme.gray200,
        ),
      ),
    );
  }
}
