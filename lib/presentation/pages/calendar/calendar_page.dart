import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/theme/app_theme.dart';
import 'package:soapah/presentation/core/theme/custom_text_theme.dart';
import 'package:soapah/presentation/core/utils/image_constant.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/custom_image_view.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';
import 'package:soapah/presentation/pages/calendar/sections/month_view.dart';
import 'package:soapah/presentation/pages/calendar/sections/week_view.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int selectedIndex = 1;

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
                    'Calendar',
                    style: CustomTextStyles.montserratBlackLarge800,
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 4.w,
                    backgroundColor: appTheme.black900,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgShare,
                      height: 6.w,
                      width: 6.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Calendar View"),
                  Wrap(
                    children: [
                      ViewSelector(
                        text: 'Week',
                        isSelected: selectedIndex == 0,
                        onTap: () => setState(() => selectedIndex = 0),
                      ),
                      SizedBox(width: 2.w),
                      ViewSelector(
                        isSelected: selectedIndex == 1,
                        text: 'Month',
                        onTap: () => setState(() => selectedIndex = 1),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              if (selectedIndex == 0) WeekView(),
              if (selectedIndex == 1) MonthView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewSelector extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback? onTap;
  const ViewSelector({
    super.key,
    required this.isSelected,
    this.text = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.w),
        decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : appTheme.white900,
          borderRadius: BorderRadius.circular(1.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? appTheme.white900 : appTheme.black900,
          ),
        ),
      ),
    );
  }
}
