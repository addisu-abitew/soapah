enum SoapTypeEnum { solid, liquid, mixed }

enum Measurement { grams, ounces, percentages }

enum WeightUnit { g, kg, lb, oz }

enum LengthUnit { cm, inch }

extension LengthSymbol on LengthUnit {
  String get symbol => name.substring(0, 2);
}
