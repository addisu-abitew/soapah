import 'package:flutter/material.dart';

class ControllerValue {
  static double toDouble(TextEditingController controller) {
    return double.tryParse(controller.text) ?? 0.0;
  }
}
