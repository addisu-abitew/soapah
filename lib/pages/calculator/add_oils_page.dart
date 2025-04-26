import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soapah/providers/calculator_provider.dart';
import 'package:soapah/providers/oils_provider.dart';
import 'package:soapah/router/app_routes.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/image_constant.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/custom_checkbox.dart';
import 'package:soapah/widgets/custom_image_view.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

class AddOilsPage extends StatelessWidget {
  const AddOilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              HeaderLogo(),
              NavigationHeader(title: 'Add oils/butters/waxes'),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  children: List.generate(
                    context.watch<OilsProvider>().oils.length,
                    (index) {
                      final oil = context.read<OilsProvider>().oils[index];
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              index.isOdd
                                  ? appTheme.gray100
                                  : appTheme.white900,
                        ),
                        child: Row(
                          children: [
                            CustomCheckboxButton(
                              value: context
                                  .watch<OilsProvider>()
                                  .isOilSelected(oil),
                              onChange:
                                  (val) =>
                                      context.read<OilsProvider>().selectOil(
                                        oil,
                                        val,
                                        context
                                            .read<CalculatorProvider>()
                                            .measurement,
                                      ),
                              text: oil.name,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                context.read<OilsProvider>().setSelectedOil(
                                  oil,
                                );
                                context.push(AppRoutes.oilQualities);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 3.w,
                                  vertical: 0.75.h,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven
                                          ? appTheme.gray100
                                          : appTheme.white900,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Qualities',
                                      style: TextStyle(
                                        color: appTheme.gray700,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgInfo,
                                      height: 16,
                                      width: 16,
                                      color: appTheme.gray700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
