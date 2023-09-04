import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/common_widgets/custom_text_filed.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

import '../../../../core/utils/assets_manager.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final reportSubjectController = TextEditingController();
  final reportDescriptionController = TextEditingController();
  List<File> files = [];

  @override
  void dispose() {
    reportSubjectController.dispose();
    reportDescriptionController.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.s30,
              ),
              Text(
                tr(LocaleKeys.create_report_report_subject),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              TextFormField(
                controller: reportSubjectController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
                  hintText: tr(LocaleKeys.create_report_enter_report_subject),
                  filled: true,
                  fillColor: ColorManager.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                tr(LocaleKeys.create_report_report_description),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              TextFormField(
                minLines: 3,
                maxLines: 6,
                controller: reportDescriptionController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                  hintText:
                      tr(LocaleKeys.create_report_enter_report_description),
                  filled: true,
                  fillColor: ColorManager.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                tr(LocaleKeys.create_report_attachments),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Container(
                height: 100.sp,
                padding: const EdgeInsets.all(AppPadding.p4),
                decoration: BoxDecoration(
                  color: ColorManager.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(allowMultiple: true);

                        if (result != null) {
                          files =
                              result.paths.map((path) => File(path!)).toList();
                          print(files);
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
                    Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: AppMargin.m8),
                                    width: 80.sp,
                                    height: 80.sp,
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Icon(Icons.file_present),
                                  ),
                                  Positioned(
                                    left: 5.sp,
                                    top:12.sp,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(1.sp),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorManager.error
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            size: 14.sp,
                                            color: ColorManager.white,
                                          ),
                                        )),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(
                                  width: AppSize.s10,
                                ),
                            itemCount: files.length*5))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
