import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/theme/app_theme.dart';
import 'package:soapah/presentation/core/theme/custom_text_theme.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

class MonthView extends StatelessWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white900,
        borderRadius: BorderRadius.circular(2.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: Column(
        children: [
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'March',
                      style: CustomTextStyles.montserratBlackLarge800,
                    ),
                    TextSpan(
                      text: ' 2021',
                      style: CustomTextStyles.montserratLarge800,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_back_ios_rounded, size: 20),
              SizedBox(width: 4.w),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
            ],
          ),
          SizedBox(height: 3.h),
          Table(
            children: [
              TableRow(
                children: [
                  Text('Sun'),
                  Text('Mon'),
                  Text('Tue'),
                  Text('Wed'),
                  Text('Thu'),
                  Text('Fri'),
                  Text('Sat'),
                ],
              ),
              TableRow(
                children: List.generate(7, (index) {
                  final date = (index + 28) % 32;
                  final isActive = date < 28;
                  return DayView(
                    date: date,
                    active: isActive,
                    isLastCell: date == 2,
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
        ],
      ),
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
        style: TextStyle(color: active ? appTheme.black900 : appTheme.gray200),
      ),
    );
  }
}
