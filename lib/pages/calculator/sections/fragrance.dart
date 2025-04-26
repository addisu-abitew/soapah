import 'package:flutter/material.dart';

import '../../../utils/size_utils.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/amount_field.dart';

class Fragrance extends StatelessWidget {
  const Fragrance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fragrance', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        AmountField(units: ['%'], selectedUnit: '%'),
      ],
    );
  }
}
