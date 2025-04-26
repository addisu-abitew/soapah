import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../models/enums.dart';
import '../../../providers/additives_provider.dart';
import '../../../providers/calculator_provider.dart';
import '../../../providers/oils_provider.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/amount_field.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_radio.dart';

class RecipeMeasurements extends StatelessWidget {
  RecipeMeasurements({super.key});

  final moldHeightController = TextEditingController();
  final moldWidthController = TextEditingController();
  final moldLengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onChanged(Measurement? value) {
      if (value == null) return;
      context.read<CalculatorProvider>().changeMeasurement(value);
      context.read<OilsProvider>().recalculateOils(value);
      context.read<AdditivesProvider>().recalculateAdditives(value);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipe Measurements',
          style: CustomTextStyles.montserratBlack900Bold,
        ),
        SizedBox(height: 1.h),
        CustomRadio<Measurement>(
          value: Measurement.grams,
          groupValue: context.watch<CalculatorProvider>().measurement,
          onChanged: onChanged,
          title: 'Grams',
        ),
        CustomRadio<Measurement>(
          value: Measurement.ounces,
          groupValue: context.watch<CalculatorProvider>().measurement,
          onChanged: onChanged,
          title: 'Ounces',
        ),
        CustomRadio<Measurement>(
          value: Measurement.percentages,
          groupValue: context.watch<CalculatorProvider>().measurement,
          onChanged: onChanged,
          title: 'Percentages',
        ),
        if (context.watch<CalculatorProvider>().measurement ==
            Measurement.percentages)
          Row(
            children: [
              Opacity(
                opacity: 0,
                child: CustomCheckboxButton(onChange: (val) {}),
              ),
              Text(
                'Total Oil Weight',
                style: CustomTextStyles.montserratBlack900Regular6_1,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: AmountField(
                  controller:
                      context.read<OilsProvider>().totalOilWeightController,
                  units: WeightUnit.values.map((unit) => unit.name).toList(),
                  selectedUnit:
                      context.watch<OilsProvider>().totalOilWeightUnit?.name,
                  onUnitChanged:
                      context.read<OilsProvider>().changeTotalOilUnit,
                  onValueChanged:
                      (val) => context.read<OilsProvider>().recalculateOils(
                        context.read<CalculatorProvider>().measurement,
                      ),
                ),
              ),
            ],
          ),
        CustomCheckboxButton(
          onChange: context.read<CalculatorProvider>().changeUseMold,
          text: 'Mold Size',
          value: context.watch<CalculatorProvider>().useMold,
        ),
        if (context.watch<CalculatorProvider>().useMold)
          Row(
            children: [
              Opacity(
                opacity: 0,
                child: CustomCheckboxButton(onChange: (_) {}),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Width',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: AmountField(
                            controller:
                                context
                                    .read<CalculatorProvider>()
                                    .moldWidthController,
                            units:
                                LengthUnit.values
                                    .map((unit) => unit.symbol)
                                    .toList(),
                            onUnitChanged:
                                context
                                    .read<CalculatorProvider>()
                                    .changeMoldSizeUnit,
                            selectedUnit:
                                context
                                    .watch<CalculatorProvider>()
                                    .moldSizeUnit
                                    ?.symbol,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Height',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: AmountField(
                            controller:
                                context
                                    .read<CalculatorProvider>()
                                    .moldHeightController,
                            units:
                                LengthUnit.values
                                    .map((unit) => unit.symbol)
                                    .toList(),
                            onUnitChanged:
                                context
                                    .read<CalculatorProvider>()
                                    .changeMoldSizeUnit,
                            selectedUnit:
                                context
                                    .watch<CalculatorProvider>()
                                    .moldSizeUnit
                                    ?.symbol,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Length',
                            style:
                                CustomTextStyles.montserratBlack900Regular6_1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: AmountField(
                            controller:
                                context
                                    .read<CalculatorProvider>()
                                    .moldLengthController,
                            units:
                                LengthUnit.values
                                    .map((unit) => unit.symbol)
                                    .toList(),
                            onUnitChanged:
                                context
                                    .read<CalculatorProvider>()
                                    .changeMoldSizeUnit,
                            selectedUnit:
                                context
                                    .watch<CalculatorProvider>()
                                    .moldSizeUnit
                                    ?.symbol,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
