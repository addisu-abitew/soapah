import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../providers/calculator_provider.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/amount_field.dart';

class Liquid extends StatelessWidget {
  const Liquid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Liquid', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'Lye Concentration',
                style: CustomTextStyles.montserratBlack900Regular6_1,
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: AmountField(
                controller:
                    context
                        .read<CalculatorProvider>()
                        .lyeConcentrationController,
                units: ['%'],
                selectedUnit: '%',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
