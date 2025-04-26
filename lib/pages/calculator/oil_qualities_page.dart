import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soapah/providers/oils_provider.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/size_utils.dart';
import 'package:soapah/widgets/header_logo.dart';
import 'package:soapah/widgets/navigation_header.dart';
import 'package:soapah/widgets/safe_scaffold.dart';

class OilQualitiesPage extends StatelessWidget {
  const OilQualitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              HeaderLogo(),
              NavigationHeader(
                title: context.watch<OilsProvider>().selectedOil!.name,
              ),
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
                    context.watch<OilsProvider>().selectedOil!.qualities.length,
                    (index) {
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
                            Text(
                              context
                                  .watch<OilsProvider>()
                                  .selectedOil!
                                  .qualities
                                  .keys
                                  .elementAt(index),
                              style: TextStyle(
                                color: appTheme.gray700,
                                fontSize: 12.sp,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              context
                                  .watch<OilsProvider>()
                                  .selectedOil!
                                  .qualities
                                  .values
                                  .elementAt(index)
                                  .toString(),
                              style: TextStyle(
                                color: appTheme.gray700,
                                fontSize: 12.sp,
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
