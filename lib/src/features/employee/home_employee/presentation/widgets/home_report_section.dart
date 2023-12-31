import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../../create_report/presentation/controller/provider/report_provider.dart';

class HomeReportSection extends StatefulWidget {
  int currentIndex;

  HomeReportSection({
    super.key,
    required this.currentIndex,
  });

  @override
  State<HomeReportSection> createState() => _HomeReportSectionState();
}

class _HomeReportSectionState extends State<HomeReportSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8, horizontal: AppPadding.p8),
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m16, vertical: AppMargin.m8),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.currentIndex == 0
                    ? ColorManager.grey.shade400
                    : ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.currentIndex = 0;
                    context.read<ReportProvider>().currentIndex=0;
                    context.read<ReportProvider>().notifyListeners();
                  });
                  print(widget.currentIndex);
                },
                child: FittedBox(
                  child: Text(
                    tr(
                      LocaleKeys.home_current_reports,
                    ),
                    style: TextStyle(color: ColorManager.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s4,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.currentIndex == 1
                    ? ColorManager.grey.shade400
                    : ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.currentIndex = 1;
                    context.read<ReportProvider>().currentIndex=1;
                    context.read<ReportProvider>().notifyListeners();
                  });
                  print(widget.currentIndex);
                },
                child: FittedBox(
                  child: Text(
                    tr(
                      LocaleKeys.home_previous_reports,
                    ),
                    style: TextStyle(color: ColorManager.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s4,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.currentIndex == 2
                    ? ColorManager.grey.shade400
                    : ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.currentIndex = 2;
                    context.read<ReportProvider>().currentIndex=2;
                    context.read<ReportProvider>().notifyListeners();
                  });
                  print(widget.currentIndex);
                },
                child: FittedBox(
                  child: Text(
                    tr(
                      LocaleKeys.home_new_reports,
                    ),
                    style: TextStyle(color: ColorManager.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}