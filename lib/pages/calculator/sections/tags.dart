import 'package:flutter/material.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../theme/custom_text_theme.dart';
import '../../../widgets/custom_text_form_field.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tags', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        CustomTextFormField(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
