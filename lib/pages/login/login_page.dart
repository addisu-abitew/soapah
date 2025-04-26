import 'package:flutter/material.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

import 'sections/login_footer.dart';
import 'sections/login_form.dart';
import 'sections/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            SizedBox(height: 3.h),
            LoginForm(),
            SizedBox(height: 2.h),
            LoginFooter(),
          ],
        ),
      ),
    );
  }
}
