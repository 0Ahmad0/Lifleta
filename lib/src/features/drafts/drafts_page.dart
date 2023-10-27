import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/provider/report_provider.dart';
import 'package:lifleta/src/features/drafts/widgets/drafts_item.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/constans.dart';
import '../../core/data/model/models.dart';
import '../../core/utils/app_constant.dart';
import '../auth/controller/provider/profile_provider.dart';

class DraftsPage extends StatefulWidget {
  const DraftsPage({super.key});

  @override
  State<DraftsPage> createState() => _DraftsPageState();
}

class _DraftsPageState extends State<DraftsPage> {
  var getReports;
  getReportsFun()  {
    getReports = FirebaseFirestore.instance.collection(AppConstants.collectionReport)
        .where('idUser',isEqualTo: context.read<ProfileProvider>().user.id)
        .where('reportType',isEqualTo: ReportType.Dreft.name)
        .snapshots();
    return getReports;
  }
  @override
  void initState() {
    getReportsFun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_drafts),
      ),
      body:
      StreamBuilder<QuerySnapshot>(
        //prints the messages to the screen0
          stream: getReports,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Const.SHOWLOADINGINDECATOR();
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {

                Const.SHOWLOADINGINDECATOR();
                context.read<ReportProvider>().reports.listReport.clear();;
                if (snapshot.data!.docs!.length > 0) {
                  context.read<ReportProvider>().reports =
                      Reports.fromJson(snapshot.data!.docs!);
                }
                return buildReports(context,reports:context.read<ReportProvider>().reports.listReport);
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          })
      ,
    );
  }
  Widget buildReports(BuildContext context,{required List<Report> reports})
  =>  reports.isEmpty?
  Const.emptyWidget(context,text: "لايوجد مسودات بعد")
      : ListView.separated(
    itemCount: reports.length,
    padding: const EdgeInsets.all(AppPadding.p12),
    itemBuilder: (_, index) => DraftItem(
        title: reports[index].subject, location:  reports[index].location?.country??'', report:  reports[index],),
    separatorBuilder: (_,__)=>SizedBox(height: AppSize.s20,),
  );


}
