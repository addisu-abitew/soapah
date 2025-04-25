import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

extension ResponsiveExtension on num {
  double get h => SizeUtils.height * (this / 100);
  double get w => SizeUtils.width * (this / 100);
  double get sp {
    final minLength =
        SizeUtils.height < SizeUtils.width ? SizeUtils.height : SizeUtils.width;
    return minLength * (this / 400);
  }
}

typedef ResponsiveBuild =
    Widget Function(
      BuildContext context,
      Orientation orientation,
      DeviceType deviceType,
    );

class Sizer extends StatelessWidget {
  final ResponsiveBuild builder;
  const Sizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}

class SizeUtils {
  static late BoxConstraints constraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  static void setScreenSize(
    BoxConstraints boxConstraints,
    Orientation currOrientation,
  ) {
    constraints = boxConstraints;
    orientation = currOrientation;

    if (orientation == Orientation.portrait) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
    } else {
      height = constraints.maxWidth;
      width = constraints.maxHeight;
    }
    deviceType = DeviceType.mobile;
  }
}
