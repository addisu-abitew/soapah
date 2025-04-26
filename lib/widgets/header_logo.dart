import 'package:flutter/widgets.dart';
import 'package:soapah/utils/size_utils.dart';

import '../utils/image_constant.dart';
import 'custom_image_view.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgLogo,
      height: 6.h,
      margin: EdgeInsets.symmetric(vertical: 2.h),
    );
  }
}
