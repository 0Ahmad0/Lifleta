import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:readmore/readmore.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
    required this.title,
    required this.reportDate,
    required this.type,
    required this.description,
    required this.location, required this.reportId,
  });

  final String title;
  final String reportDate;
  final String type;
  final String reportId;
  final String description;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.black.withOpacity(.7),
                    blurRadius: 8,
                    offset: Offset(0, 6.sp),
                    spreadRadius: 2)
              ]),
        ),
        Container(
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
                      leading: CircleAvatar(),
                      title: Text(
                        title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        reportDate + ' - ${reportId}',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: type == 'done'
                          ? ColorManager.primaryColor.withOpacity(.3)
                          : ColorManager.grey,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      type == 'done' ?
                      tr(LocaleKeys.home_done_report)
                          :
                      tr(LocaleKeys.home_current_report),
                    ),
                  )
                ],
              ),
              Container(
                  constraints: BoxConstraints(maxHeight: 120.h),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  margin: const EdgeInsets.all(AppMargin.m8),
                  decoration: BoxDecoration(
                      color: ColorManager.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: SingleChildScrollView(
                    child: ReadMoreText(
                      description,
                      trimCollapsedText: tr(LocaleKeys.home_more),
                      trimLines: 3,
                      trimLength: 100,
                      moreStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorManager.black),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              type == 'done' ?
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            )),
                        onPressed: () {},
                        child: Text(tr(LocaleKeys.home_show)),
                      )),
                  const Expanded(child: SizedBox.shrink()),

                ],
              ))
                  :
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              )),
                          onPressed: () {},
                          child: Text(tr(LocaleKeys.home_tracking)),
                        )),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              )),
                          onPressed: () {
                            _showDealyAlertDialog(context);
                          },
                          child: Text(
                            tr(LocaleKeys.home_dealy_alert),
                            style: TextStyle(color: ColorManager.black),
                          ),
                        )),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _showDealyAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              contentPadding: EdgeInsets.all(AppPadding.p12),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16, vertical: AppPadding.p30),
                    decoration: BoxDecoration(
                        color: ColorManager.grey.shade300,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      tr(LocaleKeys.home_send_report_delay_alert),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                          fontSize: 14.sp),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorManager.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.r),
                                )),
                            onPressed: () {},
                            child: Text(
                              tr(LocaleKeys.home_send),
                              style: TextStyle(color: ColorManager.white),
                            ),
                          )),
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorManager.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.r),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              tr(LocaleKeys.home_cancel),
                              style: TextStyle(color: ColorManager.black),
                            ),
                          )),
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
