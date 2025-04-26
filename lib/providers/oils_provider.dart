import 'package:flutter/material.dart';

import '../models/enums.dart';
import '../models/oil.dart';
import '../models/selected_oil.dart';
import '../utils/controller_value.dart';

class OilsProvider extends ChangeNotifier {
  List<Oil> oils = [
    Oil(id: '1', name: 'Olive Oil', qualities: qualities),
    Oil(id: '2', name: 'Coconut Oil', qualities: qualities),
    Oil(id: '3', name: 'Palm Oil', qualities: qualities),
    Oil(id: '4', name: 'Castor Oil', qualities: qualities),
    Oil(id: '5', name: 'Sunflower Oil', qualities: qualities),
    Oil(id: '6', name: 'Shea Butter', qualities: qualities),
    Oil(id: '7', name: 'Cocoa Butter', qualities: qualities),
    Oil(id: '8', name: 'Mango Butter', qualities: qualities),
    Oil(id: '9', name: 'Avocado Oil', qualities: qualities),
    Oil(id: '10', name: 'Beeswax', qualities: qualities),
    Oil(id: '11', name: 'Carnauba Wax', qualities: qualities),
    Oil(id: '12', name: 'Candelilla Wax', qualities: qualities),
  ];
  List<SelectedOil> selectedOils = [];
  Oil? selectedOil;
  WeightUnit? totalOilWeightUnit = WeightUnit.values.first;

  final totalOilsController = TextEditingController(text: '0.0');
  double totalActiveOilAmount(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return totalOilsPercentage(measurement);
      case Measurement.grams:
      case Measurement.ounces:
        return totalOilsWeight(measurement);
    }
  }

  double totalPassiveOilAmount(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return totalOilsPercentage(measurement) /
            100 *
            ControllerValue.toDouble(totalOilWeightController);
      case Measurement.grams:
      case Measurement.ounces:
        return 100.0;
    }
  }

  void recalculateOils(Measurement measurement) {
    for (final oil in selectedOils) {
      switch (measurement) {
        case Measurement.grams:
        case Measurement.ounces:
          oil.passiveAmount =
              totalOilsWeight(measurement) <= 0
                  ? 0.0
                  : double.parse(
                    (ControllerValue.toDouble(oil.controller) *
                            100 /
                            totalOilsWeight(measurement))
                        .toStringAsFixed(2),
                  );
        case Measurement.percentages:
          oil.passiveAmount = double.parse(
            (ControllerValue.toDouble(oil.controller) /
                    100 *
                    totalOilsWeight(measurement))
                .toStringAsFixed(2),
          );
      }
    }
    totalOilsController.text =
        selectedOils
            .map((oil) => ControllerValue.toDouble(oil.controller))
            .reduce((tot, val) => tot + val)
            .toString();
    notifyListeners();
  }

  final TextEditingController totalOilWeightController = TextEditingController(
    text: '0.0',
  );
  double totalOilsWeight(Measurement measurement) {
    switch (measurement) {
      case Measurement.grams:
      case Measurement.ounces:
        return double.parse(
          (selectedOils
              .map((oil) => ControllerValue.toDouble(oil.controller))
              .reduce((val, tot) => tot + val)).toStringAsFixed(2),
        );
      case Measurement.percentages:
        return ControllerValue.toDouble(totalOilWeightController);
    }
  }

  double totalOilsPercentage(Measurement measurement) {
    switch (measurement) {
      case Measurement.percentages:
        return selectedOils
            .map((oil) => ControllerValue.toDouble(oil.controller))
            .reduce((val, tot) => tot + val);
      case Measurement.grams:
      case Measurement.ounces:
        return 100.0;
    }
  }

  bool isOilSelected(Oil oil) {
    return selectedOils.map((selected) => selected.oil.id).contains(oil.id);
  }

  void selectOil(Oil oil, bool? selected, Measurement measurement) {
    if (selected == null) return;
    if (!selected) {
      selectedOils.removeWhere((element) => element.oil.id == oil.id);
    } else {
      selectedOils.add(
        SelectedOil(oil: oil, controller: TextEditingController(text: '0.0')),
      );
    }
    recalculateOils(measurement);
  }

  void setSelectedOil(Oil oil) {
    selectedOil = oil;
    notifyListeners();
  }

  void changeTotalOilUnit(String? unit) {
    totalOilWeightUnit =
        WeightUnit.values.where((u) => u.name == unit).firstOrNull;
    notifyListeners();
  }
}

const qualities = <String, num>{
  'SAP KOH': 0.168,
  'SAP NAOH': 0.141,
  'Bubbly Lather': 0.1,
  'Creamy Lather': 0.2,
  'Conditioning': 0.12,
  'Moisturizing': 0.21,
  'Hardness': 0.4,
  'Cleansing': 0.1,
  'Lather Stability': 0.2,
  'Skin Penetration': 0.1,
  'Absorbency': 0.1,
  'Non-comedogenic': 0.1,
  'Irritation': 0.1,
  'Antioxidant': 0.1,
  'Antimicrobial': 0.1,
  'Antifungal': 0.1,
  'Antibacterial': 0.1,
  'Antiviral': 0.1,
  'Antiseptic': 0.1,
  'Antiparasitic': 0.1,
  'Antiallergenic': 0.1,
  'Antiphlogistic': 0.1,
  'Antipruritic': 0.1,
  'Lauric': 2,
  'Myristic': 1,
  'Palmitic': 1,
  'Stearic': 1,
  'Oleic': 1,
  'Linoleic': 1,
  'Linolenic': 1,
  'Arachidic': 1,
  'Behenic': 1,
  'Lignoceric': 1,
  'Cerotic': 1,
  'Montanic': 1,
  'Melissic': 1,
};
