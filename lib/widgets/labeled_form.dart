import 'package:flutter/material.dart';
import 'package:soapah/utils/size_utils.dart';

import '../theme/custom_text_theme.dart';
import 'custom_text_form_field.dart';

class LabeledForm extends StatelessWidget {
  final String label;
  final bool obsecured;
  final TextEditingController? controller;
  const LabeledForm({
    required this.label,
    this.controller,
    this.obsecured = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: CustomTextStyles.montserratBlack900Bold),
          SizedBox(height: 1.h),
          CustomTextFormField(
            controller: controller,
            obscureText: obsecured,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
