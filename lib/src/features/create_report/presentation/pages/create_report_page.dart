
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/common_widgets/custom_text_filed.dart';
import 'package:lifleta/src/core/utils/app_constant.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/auth/controller/provider/profile_provider.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/report_controller.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/model/models.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../location_picker/location_picker_page.dart';

class CreateReportPage extends StatefulWidget {
  final Report? report;
  const CreateReportPage({super.key,this.report});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage>
    with SingleTickerProviderStateMixin {
  final reportSubjectController = TextEditingController();
  final reportDescriptionController = TextEditingController();
  final reportDateController = TextEditingController();
  final reportLocationController = TextEditingController();
  final refuseReportController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<File> files = [];
  Location? location;
  late ReportController reportController;
  late bool isEmployee=false;
  @override
  void initState() {
    reportController= ReportController(context: context);
    isEmployee=Provider.of<ProfileProvider>(context,listen: false).user.typeUser==AppConstants.collectionEmployee;
    if(widget.report!=null){
      files.addAll([File('')]);
      reportSubjectController.text = widget.report!.subject;//'ابلاغ عن ابلاغ عن';
      reportDescriptionController.text =widget.report!.description;// 'وصف وصف وصف وصف يوجد هناك اشياء ...................';
      reportDateController.text =DateFormat.yMd().add_Hm().format(widget.report!.dateTime) ;// '2023/8/5';
      reportLocationController.text =widget.report!.location?.country??'';// 'حي الاميرة نورة';
    }
    super.initState();
  }

  @override
  void dispose() {
    reportSubjectController.dispose();
    reportDescriptionController.dispose();
    reportDateController.dispose();
    reportLocationController.dispose();
    refuseReportController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: Text(
                    tr(LocaleKeys.create_report_report_subject),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                FadeInUp(
                  child: TextFormField(
                    readOnly: isEmployee,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return tr(LocaleKeys.text_filed_field_required);
                      }
                    },
                    controller: reportSubjectController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
                      hintText:
                          tr(LocaleKeys.create_report_enter_report_subject),
                      filled: true,
                      fillColor: ColorManager.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: Text(
                    tr(LocaleKeys.create_report_report_date),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                StatefulBuilder(builder: (context, setStateDate) {
                  return FadeInUp(
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        if(!isEmployee)
                        _selectReportDate(context).then((selectedDate) {
                          if (selectedDate != null) {
                            reportDateController.text =
                                DateFormat.yMd().add_jm().format(selectedDate);
                            setStateDate(() {});
                          }
                        });
                      },
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return tr(LocaleKeys.text_filed_field_required);
                        }
                      },
                      controller: reportDateController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
                        hintText:
                            tr(LocaleKeys.create_report_select_report_date),
                        filled: true,
                        fillColor: ColorManager.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: Text(
                    tr(LocaleKeys.create_report_report_description),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                FadeInUp(
                  child: TextFormField(
                    readOnly: isEmployee,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return tr(LocaleKeys.text_filed_field_required);
                      }
                    },
                    minLines: 3,
                    maxLines: 6,
                    controller: reportDescriptionController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 8.sp),
                      hintText:
                          tr(LocaleKeys.create_report_enter_report_description),
                      filled: true,
                      fillColor: ColorManager.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: Text(
                    tr(LocaleKeys.create_report_attachments),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                FadeInUp(
                  child: Container(
                    height: 100.sp,
                    padding: const EdgeInsets.all(AppPadding.p4),
                    decoration: BoxDecoration(
                      color: ColorManager.grey.shade300,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: StatefulBuilder(builder: (context, setStateFiles) {
                      return Row(
                        children: [
                          Visibility(
                            visible: !isEmployee,
                            child: TextButton(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker
                                    .platform
                                    .pickFiles(allowMultiple: true);

                                if (result != null) {
                                  files = result.paths
                                      .map((path) => File(path!))
                                      .toList();
                                  setStateFiles(() {});
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: Container(
                                width: 80.sp,
                                height: 80.sp,
                                decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Icon(
                                  Icons.add,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return FadeInLeft(
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: AppMargin.m8),
                                            width: 80.sp,
                                            height: 80.sp,
                                            decoration: BoxDecoration(
                                                color: ColorManager.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child:
                                                const Icon(Icons.file_present),
                                          ),
                                          Visibility(
                                            visible: !isEmployee,
                                            child: Positioned(
                                              left: 5.sp,
                                              top: 12.sp,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    files.removeAt(index);

                                                    setStateFiles(() {});
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(1.sp),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            ColorManager.error),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 14.sp,
                                                      color: ColorManager.white,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) => const SizedBox(
                                        width: AppSize.s10,
                                      ),
                                  itemCount: files.length))
                        ],
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                FadeInUp(
                  child: Text(
                    tr(LocaleKeys.create_report_location),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                FadeInUp(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () async {
                      if( !isEmployee)
                      reportLocationController.text=(await Navigator.push(context, MaterialPageRoute(builder: (_)=>const LocationPickerPage())))??'';
                    },
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return tr(LocaleKeys.text_filed_field_required);
                      }
                    },
                    controller: reportLocationController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
                      hintText: tr(LocaleKeys.create_report_select_location),
                      filled: true,
                      fillColor: ColorManager.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if(isEmployee)
                                   await reportController.addStateReport(context, status: StateReports.Processing.name, report:widget.report??Report.init() );
                                else if(widget.report!=null) {
                                  widget.report!.subject=reportSubjectController.value.text;
                                  widget.report!=reportDescriptionController.value.text;
                                  widget.report!.location= Location(country:reportLocationController.value.text );
                                  widget.report!.dateTime=DateFormat.yMd().add_jm().parse(reportDateController.value.text);
                                  await reportController.updateReport(context,report: widget.report!, files: []);

                                  }
                                  else
                                    await reportController.addReport(context,
                                      description: reportDescriptionController.value.text,
                                      subject: reportSubjectController.value.text,
                                      dateTime: DateFormat.yMd().add_jm().parse(reportDateController.value.text),
                                      location: Location(country:reportLocationController.value.text ),
                                      files: files);
                                }
                              },
                              child: Text(
                                isEmployee
                                    ?tr(LocaleKeys.create_report_accept_report)
                                    :tr(LocaleKeys.create_report_send),
                                style: TextStyle(color: ColorManager.white),
                              ))),
                    ),
                    const SizedBox(
                      width: AppSize.s20,
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.grey,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if(isEmployee){
                                    _showRefuseReportAlertDialog(context);
                                  }
                                  else if(widget.report!=null)
                                    await reportController.deleteReport(context, report: widget.report!);
                                  else {
                                    await reportController.addReport(context,
                                        description: reportDescriptionController.value.text,
                                        subject: reportSubjectController.value.text,
                                        dateTime: DateFormat.yMd().add_jm().parse(reportDateController.value.text),
                                        reportType: ReportType.Dreft.name,
                                        location: Location(country:reportLocationController.value.text ),
                                        files: files);
                                  }
                                }
                              },
                              child: Text(
                                //ToDo : Rejected statment
                                isEmployee?
                                tr(LocaleKeys.home_reject)
                                : widget.report!=null
                                    ?tr(LocaleKeys.home_cancel)
                                    :tr(LocaleKeys.create_report_save_draft),
                                style: TextStyle(color: ColorManager.black),
                              ))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                        onPressed: () async {
                          widget.report!.replay=refuseReportController.value.text;
                          await reportController.addStateReport(context, report: widget.report!, status: StateReports.Rejected.name,);
                          Navigator.pop(context);
                          },
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

  Future<DateTime?> _selectReportDate(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        builder: (context, picker) {
          return picker!;
        });
  }
}
