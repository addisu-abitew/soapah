import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../models/enums.dart';
import '../../../providers/calculator_provider.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_radio.dart';

class SoapType extends StatelessWidget {
  const SoapType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Soap Type', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        CustomRadio<SoapTypeEnum>(
          value: SoapTypeEnum.solid,
          groupValue: context.watch<CalculatorProvider>().soapType,
          onChanged: context.read<CalculatorProvider>().changeSoupType,
          title: 'Solid',
        ),
        CustomRadio<SoapTypeEnum>(
          value: SoapTypeEnum.liquid,
          groupValue: context.watch<CalculatorProvider>().soapType,
          onChanged: context.read<CalculatorProvider>().changeSoupType,
          title: 'Liquid',
        ),
        CustomRadio<SoapTypeEnum>(
          value: SoapTypeEnum.mixed,
          groupValue: context.watch<CalculatorProvider>().soapType,
          onChanged: context.read<CalculatorProvider>().changeSoupType,
          title: 'Mixed',
        ),
        Padding(padding: EdgeInsets.all(0.5.h), child: Divider(height: 3)),
        CustomCheckboxButton(
          onChange: context.read<CalculatorProvider>().changeIsMasterBatch,
          text: 'Master Batch',
          value: context.watch<CalculatorProvider>().masterBatch,
        ),
      ],
    );
  }
}
