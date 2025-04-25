import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';
import 'package:soapah/presentation/core/widgets/safe_scaffold.dart';

import 'sections/signup_footer.dart';
import 'sections/signup_form.dart';
import 'sections/signup_header.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SignupHeader(),
            SizedBox(height: 3.h),
            const SignupForm(),
            SizedBox(height: 2.h),
            const SignupFooter(),
          ],
        ),
      ),
    );
  }
}
