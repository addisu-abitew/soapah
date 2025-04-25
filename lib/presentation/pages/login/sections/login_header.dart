import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/widgets/custom_image_view.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgWelcomeBg,
              height: 30.h,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 4.5.w,
                  backgroundColor: Colors.black.withValues(alpha: 0.5),
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        CustomImageView(imagePath: ImageConstant.imgLogo, height: 5.h),
      ],
    );
  }
}
