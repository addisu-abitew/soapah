import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soapah/utils/size_utils.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/custom_text_theme.dart';
import '../../../widgets/custom_image_view.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  final List<File> _images = [];
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFiles = await picker.pickMultiImage();

    setState(() {
      _images.addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Images', style: CustomTextStyles.montserratBlack900Bold),
        SizedBox(height: 1.h),
        if (_images.isNotEmpty)
          Column(
            children: [
              Wrap(
                children:
                    _images
                        .map(
                          (image) => Stack(
                            children: [
                              CustomImageView(
                                imagePath: image.path,
                                width: 25.w,
                                height: 25.w,
                                fit: BoxFit.cover,
                                radius: BorderRadius.circular(4.sp),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 3.sp,
                                  vertical: 0.5.h,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap:
                                      () => setState(() {
                                        _images.removeWhere(
                                          (i) => i.hashCode == image.hashCode,
                                        );
                                      }),
                                  child: CircleAvatar(
                                    backgroundColor: appTheme.gray700,
                                    radius: 10.sp,
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: appTheme.red500,
                                      size: 10.sp * 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 1.h),
            ],
          ),
        GestureDetector(
          onTap: () => getImageFromGallery(),
          child: DottedBorder(
            color: appTheme.gray200,
            dashPattern: [8, 6],
            borderType: BorderType.RRect,
            radius: Radius.circular(2.w),
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Click to upload',
                          style: CustomTextStyles.montserratBlack900Medium4
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        TextSpan(
                          text: ' or drag and drop',
                          style: CustomTextStyles.montserratBlack900Medium4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'SVG, PNG, JPG or GIF (max. 800x400px)',
                    style: CustomTextStyles.montserratBlack900Medium4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
