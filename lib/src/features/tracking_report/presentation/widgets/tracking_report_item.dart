import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/report_controller.dart';
import 'package:readmore/readmore.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../core/utils/values_manager.dart';

class TrackingReportItem extends StatelessWidget {
  const TrackingReportItem({
    super.key,
    required this.status,
    required this.reportId,
    required this.reportSubject,
    required this.reportDescription,
  });

  final String status;
  final String reportId;
  final String reportSubject;
  final String reportDescription;

  Color _getStatusReportColor(BuildContext context,String status) {
    return ReportController(context: context).getStateColor(status: status);
    // switch (status) {
    //   case 'جاري معالجة البلاغ':
    //     return Color(0xffD3BEA4);
    //   case 'جاري تنفيذ البلاغ':
    //     return Color(0xffBA7929).withOpacity(.68);
    //   case 'تم تنفيذ البلاغ':
    //     return Color(0xff3A8977).withOpacity(.64);
    //   default:
    //     return ColorManager.primaryColor;
    // }
  }

  List<Color> _getStatusItemColor(String status) {
    switch (status) {
      case 'جاري معالجة البلاغ':
        return [Color(0xffD3BEA4), ColorManager.grey, ColorManager.grey];
      case 'جاري تنفيذ البلاغ':
        return [
          Color(0xffD3BEA4),
          Color(0xffBA7929).withOpacity(.68),
          ColorManager.grey
        ];
      case 'تم تنفيذ البلاغ':
        return [
          Color(0xffD3BEA4),
          Color(0xffBA7929).withOpacity(.68),
          Color(0xff3A8977).withOpacity(.64)
        ];
      default:
        return [ColorManager.grey, ColorManager.grey, ColorManager.grey];
    }
  }

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
        margin: EdgeInsets.only(
          right: context.locale.languageCode =='ar'?10.sp:0.0,
          left: context.locale.languageCode =='en'?10.sp:0.0,

        ),
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
                  child:  ListTile(
                    title: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: reportId,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primaryColor)),
                    ])),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: _getStatusReportColor(context,status),
                    borderRadius: BorderRadius.horizontal(
                      right: context.locale.languageCode == 'ar'
                          ? Radius.circular(14.r)
                          : Radius.zero,
                      left: context.locale.languageCode == 'en'
                          ? Radius.circular(14.r)
                          : Radius.zero,
                    ),
                  ),
                  child: Text(status),
                )
              ],
            ),
            ListTile(
              title: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'تاريخ البلاغ : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primaryColor)),
                TextSpan(
                    text: DateFormat.yMd(/*'ar_SA' arabic format*/)
                        .add_jm()
                        .format(
                          DateTime.now(),
                        ),
                    style:
                        TextStyle(color: ColorManager.grey, fontSize: 12.sp)),
              ])),
            ),
            ListTile(
              title: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'موضوع البلاغ : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primaryColor)),
                TextSpan(
                    text: reportSubject,
                    style: TextStyle(
                      color: ColorManager.grey,
                    )),
              ])),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.sp),
                  height: 6.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    //change To status Color
                    color: _getStatusItemColor(status)[index],
                  ),
                ));
              }),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
          ],
        ),
      ),
    );
  }
}
