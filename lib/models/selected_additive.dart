import 'package:flutter/material.dart';

import 'additive.dart';

class SelectedAdditive {
  final Additive additive;
  final TextEditingController controller;
  double passiveAmount;

  SelectedAdditive({
    required this.additive,
    required this.controller,
    this.passiveAmount = 0.0,
  });
}
