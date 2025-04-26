import 'package:flutter/material.dart';

import 'oil.dart';

class SelectedOil {
  final Oil oil;
  final TextEditingController controller;
  double passiveAmount;

  SelectedOil({
    required this.oil,
    required this.controller,
    this.passiveAmount = 0.0,
  });
}
