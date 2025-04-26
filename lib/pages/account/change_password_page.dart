import 'package:flutter/material.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_elevated_button.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/labeled_form.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              HeaderLogo(),
              NavigationHeader(title: 'Change Password'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  color: appTheme.white900,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [BoxShadow(color: appTheme.gray200)],
                ),
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    LabeledForm(label: 'Current Password', obsecured: true),
                    LabeledForm(label: 'New Password', obsecured: true),
                    LabeledForm(label: 'Confirm New Password', obsecured: true),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              CustomElevatedButton(text: 'Save Changes'),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
