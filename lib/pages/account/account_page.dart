import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soapah/providers/auth_provider.dart';
import 'package:soapah/router/app_routes.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/image_constant.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_elevated_button.dart';
import 'package:soapah/widgets/custom_image_view.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

import '../../widgets/labeled_form.dart';
import 'sections/profile_pic.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              HeaderLogo(),
              NavigationHeader(title: 'Account'),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.white900,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [BoxShadow(color: appTheme.gray100)],
                ),
                margin: EdgeInsets.symmetric(vertical: 1.h),
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    ProfilePic(),
                    LabeledForm(
                      label: 'User Name',
                      controller: TextEditingController(
                        text:
                            context
                                .read<AuthProvider>()
                                .currentUser
                                ?.displayName,
                      ),
                    ),
                    LabeledForm(label: 'Country (optional)'),
                    LabeledForm(label: 'City (optional)'),
                    LabeledForm(label: 'State (optional)'),
                    SizedBox(height: 1.h),
                    CustomElevatedButton(text: 'Save Changes'),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                text: 'Inbox ',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(appTheme.gray650),
                ),
                rightIcon: CustomImageView(imagePath: ImageConstant.imgInbox),
              ),
              SizedBox(height: 1.5.h),
              CustomElevatedButton(
                text: 'Settings ',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(appTheme.gray650),
                ),
                rightIcon: CustomImageView(
                  imagePath: ImageConstant.imgSettings,
                ),
              ),
              SizedBox(height: 1.5.h),
              CustomElevatedButton(
                text: 'Change Password',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(appTheme.gray650),
                ),
                onPressed: () => context.push(AppRoutes.changePassword),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                text: 'Log Out',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(appTheme.red500),
                ),
                onPressed: () => context.read<AuthProvider>().signOut(),
              ),
              SizedBox(height: 1.5.h),
              CustomElevatedButton(
                text: 'Delete Account',
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(appTheme.red900),
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
