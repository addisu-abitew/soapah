import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../providers/additives_provider.dart';
import '../../../providers/calculator_provider.dart';
import '../../../providers/oils_provider.dart';
import '../../../router/app_routes.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/amount_field.dart';
import '../../../widgets/custom_elevated_button.dart';

class Additives extends StatelessWidget {
  const Additives({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Additives', style: CustomTextStyles.montserratBlack900Bold),
            Spacer(),
            CustomElevatedButton(
              onPressed: () => context.push(AppRoutes.addAdditives),
              text: 'Add Additives',
              width: 35.w,
              height: 3.5.h,
              buttonTextStyle: CustomTextStyles.montserratWhite800LargeBold,
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Column(
          children: [
            ...context.watch<AdditivesProvider>().selectedAdditives.map((
              selected,
            ) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      selected.additive.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Expanded(
                    flex: 2,
                    child: AmountField(
                      controller: selected.controller,
                      units: [context.watch<CalculatorProvider>().activeUnit],
                      selectedUnit:
                          context.watch<CalculatorProvider>().activeUnit,
                      onValueChanged:
                          (val) => context
                              .read<AdditivesProvider>()
                              .recalculateAdditives(
                                context.read<CalculatorProvider>().measurement,
                              ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Container(
                    width: 62,
                    padding: EdgeInsets.all(5),
                    child: Builder(
                      builder: (context) {
                        final text =
                            '${selected.passiveAmount} ${context.watch<CalculatorProvider>().passiveUnit}';
                        final textSize = SizeUtils.fontSize(
                          maxWidth: 50,
                          text: text,
                          style: TextStyle(),
                          minTextLength: 7,
                        );

                        return Text(text, style: TextStyle(fontSize: textSize));
                      },
                    ),
                  ),
                  SizedBox(width: 1.w),
                  InkWell(
                    onTap:
                        () => context.read<AdditivesProvider>().selectAdditive(
                          selected.additive,
                          false,
                          context.read<CalculatorProvider>().measurement,
                        ),
                    child: Icon(Icons.cancel_rounded, color: appTheme.red500),
                  ),
                ],
              );
            }),
            Divider(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Total',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  flex: 2,
                  child: AmountField(
                    controller:
                        context
                            .read<AdditivesProvider>()
                            .totalAdditivesController,
                    hintText: '',
                    readOnly: true,
                    units: [context.watch<CalculatorProvider>().activeUnit],
                    selectedUnit:
                        context.watch<CalculatorProvider>().activeUnit,
                  ),
                ),
                SizedBox(width: 1.w),
                Container(
                  alignment: Alignment.center,
                  width: 62,
                  padding: EdgeInsets.all(5),
                  child: Builder(
                    builder: (context) {
                      final text =
                          '${context.watch<OilsProvider>().totalPassiveOilAmount(context.read<CalculatorProvider>().measurement)} ${context.watch<CalculatorProvider>().passiveUnit}';
                      final textSize = SizeUtils.fontSize(
                        maxWidth: 50,
                        text: text,
                        style: TextStyle(),
                        minTextLength: 7,
                      );
                      return Text(text, style: TextStyle(fontSize: textSize));
                    },
                  ),
                ),
                SizedBox(width: 1.w),
                Opacity(
                  opacity: 0,
                  child: Icon(Icons.cancel_rounded, color: appTheme.red500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
