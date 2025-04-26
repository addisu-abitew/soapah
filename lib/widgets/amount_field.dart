import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soapah/utils/size_utils.dart';

import 'custom_dropdown.dart';
import 'custom_text_form_field.dart';

class AmountField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final List<String> units;
  final String? selectedUnit;
  final void Function(String?)? onUnitChanged;
  final void Function(String?)? onValueChanged;
  final bool readOnly;
  const AmountField({
    required this.units,
    required this.selectedUnit,
    this.readOnly = false,
    this.hintText,
    this.controller,
    this.onUnitChanged,
    this.onValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      readOnly: readOnly,
      onChanged: onValueChanged,
      textInputType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      hintText: hintText,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      suffix:
          units.isEmpty
              ? null
              : units.length == 1
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(units.first),
              )
              : CustomDropdown<String>(
                items:
                    units
                        .map(
                          (unit) => DropdownMenuItem<String>(
                            value: unit,
                            child: Text(unit),
                          ),
                        )
                        .toList(),
                onChanged: onUnitChanged,
                value: selectedUnit,
              ),
      suffixConstraints: BoxConstraints(maxWidth: 52),
    );
  }
}
