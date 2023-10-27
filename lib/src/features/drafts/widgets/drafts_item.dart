import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/data/model/models.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:readmore/readmore.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/values_manager.dart';

class DraftItem extends StatelessWidget {
  const DraftItem({
    super.key,
    required this.title,
    required this.location, required this.report,
  });

  final Report report;
  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goRouter.goNamed(AppRoute.createReport.name,extra: report);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                      color: ColorManager.black.withOpacity(.4),
                      blurRadius: 8,
                      offset: Offset(0, 6.sp),
                      spreadRadius: 2)
                ]),
            child: Container(
              margin: EdgeInsets.only(
                right: context.locale.languageCode == 'ar' ? 10.sp : 0.0,
                left: context.locale.languageCode == 'en' ? 10.sp : 0.0,
              ),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.bookmark_rounded,
                      color: ColorManager.primaryColor,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorManager.primaryColor,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: ColorManager.primaryColor,
                    ),
                    title: Text(
                      location,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: context.locale.languageCode == 'en' ? 0 : null,
            left: context.locale.languageCode == 'ar' ? 0 : null,
            top: 0,
            child: Icon(
              Icons.bookmark,
              size: 40.sp,
            ),
          ),
        ],
      ),
    );
  }
}
