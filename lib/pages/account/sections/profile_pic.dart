import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_utils.dart';
import '../../../providers/auth_provider.dart';
import '../../../utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePicSize = 30.w;
    return CustomImageView(
      imagePath:
          context.watch<AuthProvider>().currentUser?.photoURL ??
          ImageConstant.imgSplashBg,
      height: profilePicSize,
      width: profilePicSize,
      radius: BorderRadius.circular(profilePicSize / 2),
      fit: BoxFit.cover,
    );
  }
}
