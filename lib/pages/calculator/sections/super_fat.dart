import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_utils.dart';
import '../../../providers/calculator_provider.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/amount_field.dart';

class Superfat extends StatelessWidget {
  const Superfat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Superfat', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        AmountField(
          controller: context.read<CalculatorProvider>().superfatController,
          units: ['%'],
          selectedUnit: '%',
        ),
      ],
    );
  }
}
