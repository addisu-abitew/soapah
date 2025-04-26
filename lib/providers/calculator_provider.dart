import 'package:flutter/material.dart';

import '../models/enums.dart';

class CalculatorProvider with ChangeNotifier {
  String? recipeName;
  SoapTypeEnum soapType = SoapTypeEnum.solid;
  bool masterBatch = false;
  Measurement measurement = Measurement.grams;
  bool useMold = false;

  LengthUnit? moldSizeUnit = LengthUnit.values.first;
  final moldHeightController = TextEditingController();
  final moldWidthController = TextEditingController();
  final moldLengthController = TextEditingController();

  final TextEditingController lyeConcentrationController =
      TextEditingController();
  final TextEditingController superfatController = TextEditingController();

  String get activeUnit {
    switch (measurement) {
      case Measurement.grams:
        return 'g';
      case Measurement.ounces:
        return 'oz';
      case Measurement.percentages:
        return '%';
    }
  }

  String get passiveUnit {
    switch (measurement) {
      case Measurement.grams:
        return '%';
      case Measurement.ounces:
        return '%';
      case Measurement.percentages:
        return 'g';
    }
  }

  void changeSoupType(SoapTypeEnum? type) {
    soapType = type ?? SoapTypeEnum.solid;
    notifyListeners();
  }

  void changeIsMasterBatch(bool isMasterBatch) {
    masterBatch = isMasterBatch;
    notifyListeners();
  }

  void changeMeasurement(Measurement? measurement) {
    this.measurement = measurement ?? Measurement.grams;
    notifyListeners();
  }

  void changeUseMold(bool? useMold) {
    this.useMold = useMold ?? false;
    notifyListeners();
  }

  changeMoldSizeUnit(String? unit) {
    moldSizeUnit = LengthUnit.values.where((u) => u.symbol == unit).firstOrNull;
    notifyListeners();
  }
}
