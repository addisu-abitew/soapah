import 'package:flutter/material.dart';
import 'package:soapah/utils/image_constant.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_image_view.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

class ComingSoonPage extends StatelessWidget {
  final String path;
  const ComingSoonPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: Container(
        width: 100.w,
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            HeaderLogo(),
            NavigationHeader(title: path),
            Expanded(
              child: Center(
                child: CustomImageView(imagePath: ImageConstant.imgComingSoon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
