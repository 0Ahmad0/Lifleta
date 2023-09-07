import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:readmore/readmore.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../core/utils/values_manager.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.type,
    required this.title,
    required this.description,
  });

  final String type;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        margin: EdgeInsets.only(right: 10.sp),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.notifications,color: ColorManager.primaryColor,),
                    title: Text(
                      title,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: type == 'read'
                        ? ColorManager.primaryColor.withOpacity(.3)
                        : ColorManager.grey.shade300,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    type == 'read' ?
                   'مقروء'
                        :
                    'غير مقروء',
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('موضوع البلاغ : ',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      Flexible(
                        child: ReadMoreText(
                          description,
                          trimCollapsedText: tr(LocaleKeys.home_more),
                          trimLines: 2,
                          trimLength: 100,
                          moreStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: ColorManager.black),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: AppSize.s10,)
          ],
        ),
      ),
    );
  }
}
