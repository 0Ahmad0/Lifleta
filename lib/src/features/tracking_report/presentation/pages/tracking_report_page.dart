import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/features/tracking_report/presentation/widgets/tracking_report_item.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';

class TrackingReportPage extends StatefulWidget {
  const TrackingReportPage({super.key});

  @override
  State<TrackingReportPage> createState() => _TrackingReportPageState();
}

class _TrackingReportPageState extends State<TrackingReportPage> {

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
            reportId: '',
            status: index == 0 ?'تم تنفيذ البلاغ':index == 1?'جاري تنفيذ البلاغ':'جاري معالجة البلاغ',
            reportDescription: 'ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ',
          ),
          separatorBuilder: (_,__)=>const SizedBox(height: AppSize.s20,),
          itemCount: 10
      ),
    );
  }
}
