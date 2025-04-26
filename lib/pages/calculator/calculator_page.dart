import 'package:flutter/material.dart';

import '../../utils/size_utils.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/header_logo.dart';
import '../../widgets/navigation_header.dart';
import '../../widgets/safe_scaffold.dart';
import 'sections/additives.dart';
import 'sections/fragrance.dart';
import 'sections/images.dart';
import 'sections/liquid.dart';
import 'sections/notes.dart';
import 'sections/oils.dart';
import 'sections/recipe_measurement.dart';
import 'sections/recipe_name.dart';
import 'sections/soap_type.dart';
import 'sections/super_fat.dart';
import 'sections/tags.dart';

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
              HeaderLogo(),
              NavigationHeader(title: 'Calculator'),
              SizedBox(height: 2.h),
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
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h),
                    RecipeName(),
                    SizedBox(height: 2.h),
                    SoapType(),
                    SizedBox(height: 2.h),
                    RecipeMeasurements(),
                    SizedBox(height: 2.h),
                    Liquid(),
                    SizedBox(height: 2.h),
                    Superfat(),
                    SizedBox(height: 2.h),
                    Oils(),
                    SizedBox(height: 2.h),
                    Additives(),
                    SizedBox(height: 2.h),
                    Fragrance(),
                    SizedBox(height: 2.h),
                    Tags(),
                    SizedBox(height: 2.h),
                    Notes(),
                    SizedBox(height: 2.h),
                    Images(),
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
