import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/tracking_report/presentation/pages/tracking_report_page.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/data/model/models.dart';
import '../../../../create_report/presentation/controller/provider/report_provider.dart';
import '../../../../create_report/presentation/controller/report_controller.dart';
import '../../../../create_report/presentation/pages/create_report_page.dart';

class ReportItem extends StatefulWidget {
  const ReportItem({
    super.key,
    required this.title,
    required this.reportDate,
    required this.type,
    required this.description,
    required this.location, required this.reportId, required this.report,
  });

  final String title;
  final String reportDate;
  final String type;
  final String reportId;
  final Report report ;
  final String description;
  final String location;

  @override
  State<ReportItem> createState() => _ReportItemState();
}

class _ReportItemState extends State<ReportItem> {
  final refuseReportController = TextEditingController();
  final statusReportController = TextEditingController();
  List<String> _reportStatus = [
    tr(LocaleKeys.home_done_report),
    tr(LocaleKeys.home_not_done_report),
  ];

  @override
  void dispose() {
    refuseReportController.dispose();
    statusReportController.dispose();
    super.dispose();
  }
  _showRefuseReportAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          contentPadding: EdgeInsets.all(AppPadding.p12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tr(LocaleKeys.home_enter_the_reason_refusing_report),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(AppPadding.p16),
                decoration: BoxDecoration(
                    color: ColorManager.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextFormField(
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  controller: refuseReportController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  minLines: 3,
                  maxLines: 5,
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

  _showStatusReportAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          contentPadding: EdgeInsets.all(AppPadding.p12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tr(LocaleKeys.home_please_select_status_report),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              StatefulBuilder(builder: (context, setStatusState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _reportStatus.map((e) => Row(
                    children: [
                      Radio(
                          value: e,
                          groupValue: statusReportController.text,
                          onChanged: (value){
                            setStatusState((){
                              statusReportController.text = value.toString();
                            });
                          }),
                      Text(e)
                    ],
                  )).toList(),
                );
              }),
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
                        onPressed: () async {
                          statusReportController.text==tr(LocaleKeys.home_done_report)?
                          await ReportController(context: context).addStateReport(context, report: widget.report!, status: StateReports.Implemented.name)
                              :await ReportController(context: context).addStateReport(context, report: widget.report!, status: StateReports.Failing.name)
                          ;
                        },
                        child: Text(
                          tr(LocaleKeys.home_update),
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
                      leading: Icon(Icons.warning_amber_rounded,color: ColorManager.error,size: 30.sp,),
                      title: Text(
                        widget.title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        widget.reportDate + ' - ${widget.reportId}',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: widget.type == StateReports.Implemented.name
                          ? ColorManager.primaryColor.withOpacity(.3)
                          : ColorManager.grey,
                      borderRadius: BorderRadius.horizontal(
                        right: context.locale.languageCode == 'ar'?Radius.circular(14.r):Radius.zero,
                          left: context.locale.languageCode == 'en'?Radius.circular(14.r):Radius.zero,

                      ),
                    ),
                    child: Text(

                      ReportController(context: context).getStateTr(state: widget.type)
                      // widget.type == 'done' ?
                      // tr(LocaleKeys.home_done_report)
                      //     :
                      // tr(LocaleKeys.home_current_report),
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
                      widget.description,
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
                      widget.location,
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              widget.type ==StateReports.Suspended.name ?
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>CreateReportPage(
                                report: widget.report,
                              )
                          ));
                        },
                        child: Text(tr(LocaleKeys.home_show)),
                      )),
                  const Expanded(child: SizedBox.shrink()),

                ],
              ))
                  :
              widget.type ==StateReports.Processing.name ?
              Expanded(
                child: Row(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            )),
                        onPressed: () {
                          _showStatusReportAlertDialog(context);
                        },
                        child: Text(
                          tr(LocaleKeys.home_update),
                          style: TextStyle(color: ColorManager.black),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
              )
              :Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            )),
                        onPressed: () {
                          context.read<ReportProvider>().report=widget.report;
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>TrackingReportPage()
                          ));
                        },
                        child: Text(tr(LocaleKeys.home_tracking)),
                      )),
                  const Expanded(child: SizedBox.shrink()),

                ],
              )),

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
