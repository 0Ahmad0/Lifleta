import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/data/model/models.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/features/tracking_report/presentation/widgets/tracking_report_item.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../create_report/presentation/controller/provider/report_provider.dart';

class TrackingReportPage extends StatefulWidget {
  const TrackingReportPage({super.key});

  @override
  State<TrackingReportPage> createState() => _TrackingReportPageState();
}

class _TrackingReportPageState extends State<TrackingReportPage> {

  @override
  Widget build(BuildContext context) {
    Report report=context.read<ReportProvider>().report;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),
        actions: [
          IconButton(
              onPressed: () {
                goRouter.pushNamed(AppRoute.notification.name);
              },
              icon: const Icon(
                Icons.notifications,
              )),
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(AppPadding.p16),
          itemBuilder: (_,index)=>TrackingReportItem(
            reportId:report.numReport,
            reportSubject: report.subject,
            status: report.states[index] == StateReports.Implemented.name ?tr(LocaleKeys.state_report_report_implemented)
                :report.states[index] == StateReports.Processing.name ?tr(LocaleKeys.state_report_report_being_implemented)
                :report.states[index] == StateReports.Failing.name?tr(LocaleKeys.state_report_report_failed)
                :report.states[index] == StateReports.Rejected.name ?tr(LocaleKeys.state_report_report_rejected)
                :tr(LocaleKeys.state_report_report_processed),
            reportDescription: report.description
            //'ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ',
          ),
          separatorBuilder: (_,__)=>const SizedBox(height: AppSize.s20,),
          itemCount: report.states.length
      ),
    );
  }
}
