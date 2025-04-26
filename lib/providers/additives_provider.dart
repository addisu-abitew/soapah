import 'package:flutter/material.dart';

import '../models/additive.dart';
import '../models/enums.dart';
import '../models/selected_additive.dart';
import '../utils/controller_value.dart';

class AdditivesProvider extends ChangeNotifier {
  final additives = [
    Additive(id: '1', name: 'Activated Charchol', qualities: additiveQualities),
    Additive(id: '2', name: 'Aloe Powder', qualities: additiveQualities),
    Additive(id: '3', name: 'Baking Soda', qualities: additiveQualities),
    Additive(id: '4', name: 'Beeswax', qualities: additiveQualities),
    Additive(id: '5', name: 'Bentonite Clay', qualities: additiveQualities),
    Additive(id: '6', name: 'Cocoa Powder', qualities: additiveQualities),
    Additive(
      id: '7',
      name: 'Coconut Milk Powder',
      qualities: additiveQualities,
    ),
    Additive(id: '8', name: 'Cornstarch', qualities: additiveQualities),
    Additive(id: '9', name: 'Diatomaceous Earth', qualities: additiveQualities),
    Additive(id: '10', name: 'French Green Clay', qualities: additiveQualities),
    Additive(id: '11', name: 'French Pink Clay', qualities: additiveQualities),
    Additive(
      id: '12',
      name: 'French Yellow Clay',
      qualities: additiveQualities,
    ),
  ];
  List<SelectedAdditive> selectedAdditives = [];
  Additive? selectedAdditive;
  WeightUnit? totalAdditiveWeightUnit = WeightUnit.values.first;

  final totalAdditivesController = TextEditingController(text: '0.0');
  double totalActiveAdditiveAmount(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return totalAdditivesPercentage(measurement);
      case Measurement.grams:
      case Measurement.ounces:
        return totalAdditivesWeight(measurement);
    }
  }

  double totalPassiveAdditiveAmount(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return totalAdditivesPercentage(measurement) /
            100 *
            ControllerValue.toDouble(totalAdditiveWeightController);
      case Measurement.grams:
      case Measurement.ounces:
        return 100.0;
    }
  }

  void recalculateAdditives(Measurement measurement) {
    for (final additive in selectedAdditives) {
      switch (measurement) {
        case Measurement.grams:
        case Measurement.ounces:
          additive.passiveAmount =
              totalAdditivesWeight(measurement) <= 0
                  ? 0.0
                  : double.parse(
                    (ControllerValue.toDouble(additive.controller) *
                            100 /
                            totalAdditivesWeight(measurement))
                        .toStringAsFixed(2),
                  );
        case Measurement.percentages:
          additive.passiveAmount = double.parse(
            (ControllerValue.toDouble(additive.controller) /
                    100 *
                    totalAdditivesWeight(measurement))
                .toStringAsFixed(2),
          );
      }
    }
    totalAdditivesController.text =
        selectedAdditives
            .map((additive) => ControllerValue.toDouble(additive.controller))
            .reduce((tot, val) => tot + val)
            .toString();
    notifyListeners();
  }

  final TextEditingController totalAdditiveWeightController =
      TextEditingController(text: '0.0');
  double totalAdditivesWeight(Measurement measurement) {
    switch (measurement) {
      case Measurement.grams:
      case Measurement.ounces:
        return selectedAdditives
            .map((additive) => ControllerValue.toDouble(additive.controller))
            .reduce((val, tot) => tot + val);
      case Measurement.percentages:
        return ControllerValue.toDouble(totalAdditiveWeightController);
    }
  }

  double totalAdditivesPercentage(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return selectedAdditives
            .map((additive) => ControllerValue.toDouble(additive.controller))
            .reduce((val, tot) => tot + val);
      case Measurement.grams:
      case Measurement.ounces:
        return 100.0;
    }
  }

  bool isAdditiveSelected(Additive additive) {
    return selectedAdditives
        .map((selected) => selected.additive.id)
        .contains(additive.id);
  }

  void selectAdditive(
    Additive additive,
    bool? selected,
    Measurement measurement,
  ) {
    if (selected == null) return;
    if (!selected) {
      selectedAdditives.removeWhere(
        (element) => element.additive.id == additive.id,
      );
    } else {
      selectedAdditives.add(
        SelectedAdditive(
          additive: additive,
          controller: TextEditingController(text: '0.0'),
        ),
      );
    }
    recalculateAdditives(measurement);
  }

  void setSelectedAdditive(Additive additive) {
    selectedAdditive = additive;
    notifyListeners();
  }

  void changeTotalAdditiveUnit(String? unit) {
    totalAdditiveWeightUnit =
        WeightUnit.values.where((u) => u.name == unit).firstOrNull;
    notifyListeners();
  }
}

const additiveQualities = <String, String>{
  'Purpose': "Lubricant",
  'Usage Rate': '1 teaspoon per pound of additives',
  'Method': 'Add to additives before mixing in lye solution',
};
