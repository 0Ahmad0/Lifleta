

import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/provider/report_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../common_widgets/constans.dart';
import '../../../../core/data/model/models.dart';
import '../../../../core/network/utils/firebase.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../auth/controller/provider/profile_provider.dart';
import '../../../notification/controller/provider/notification_provider.dart';


class ReportController{
  late ReportProvider reportProvider;
  var context;
  ReportController({required this.context}){
    reportProvider= Provider.of<ReportProvider>(context,listen: false);
  }

  addReport(context,  {  required String description,
    required String subject,
     String? reportType,
    required DateTime dateTime,
    required Location? location,
    required List<File> files}) async {
    ProfileProvider profileProvider= Provider.of<ProfileProvider>(context,listen: false);
    Const.loading(context);
    String numReport= genOrderId();
    var result;
       result=await reportProvider.addReport(context, report: Report(
         numReport:numReport,
           idUser: profileProvider.user.id,
           description: description, subject: subject, dateTime: dateTime
           ,location: location, files: [], states: [StateReports.Suspended.name], status: StateReports.Suspended.name, reportType: reportType??ReportType.None.name),
       files: files);
       if(result['status']){
         if((reportType??ReportType.None.name)==ReportType.None.name)
         NotificationProvider().addNotification(context, notification:
           Notification(idUser: AppConstants.collectionEmployee, subtitle: tr(LocaleKeys.notification_new_report_subTitle)+' ${numReport}', dateTime: DateTime.now(), title: tr(LocaleKeys.notification_new_report_title), message: ''));

    goRouter.pop();
       }
       Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
     goRouter.pop();
    return result;
  }

  updateReport(context,{ required Report report,required List<File> files}) async {
    Const.loading(context);
    var result=await reportProvider.updateReport(context,report: report,files:files);
     goRouter.pop();
    if(result['status']){
        goRouter.pop();
      //  goRouter.pop();
    }
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  addStateReport(context,{ required String status,required Report report}) async {
    Const.loading(context);
    report.states.add(status);
    report.status=status;
    var result=await reportProvider.updateReport(context,report: report,files:[]);
    goRouter.pop();
    if(result['status']){
      NotificationProvider().addNotification(context, notification:
      Notification(idUser: report.idUser, subtitle: '${ getStateNotification(state: status)['subTitle']} ${report.numReport}', dateTime: DateTime.now(), title: getStateNotification(state: status)['title'], message: ''));

        goRouter.pop();
      //  goRouter.pop();
    }
    else{
      report.states.removeLast();
      report.status=report.states.first;
    }
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  addNotifyReport(context,{ required Report report}) async {
    Const.loading(context);
    var result=   await NotificationProvider().addNotification(context, notification:
    Notification(idUser: AppConstants.collectionEmployee, subtitle:tr(LocaleKeys.notification_notify_report_subTitle)+ ' ${report.numReport}', dateTime: DateTime.now(), title: tr(LocaleKeys.notification_notify_report_title), message: ''));
    goRouter.pop();
    if(result['status']){

        goRouter.pop();
      //  goRouter.pop();
    }
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  deleteReport(context,{ required Report report}) async {
    Const.loading(context);
    await reportProvider.deleteReport(context,report: report);
     goRouter.pop();
    goRouter.pop();
  }
  String getStateTr({ required String state})  {
    if(state==StateReports.Implemented.name)
      return  tr(LocaleKeys.home_done_report,);
    else if(state==StateReports.Rejected.name)
      return  tr(LocaleKeys.home_rejected_report,);
    else if(state==StateReports.Failing.name)
      return  tr(LocaleKeys.home_not_done_report,);
    else if(state==StateReports.Processing.name)
      return  tr(LocaleKeys.home_current_report,);
    else
      return  tr(LocaleKeys.home_new_report,);
  }
   getStateColor({ required String status})  {
    if(status==tr(LocaleKeys.state_report_report_processed))
      return Color(0xffD3BEA4);
    else if(status==tr(LocaleKeys.state_report_report_being_implemented))
      return  Color(0xffBA7929).withOpacity(.68);
    else if(status==tr(LocaleKeys.state_report_report_implemented))
      return Color(0xff3A8977).withOpacity(.64);
    else if(status==tr(LocaleKeys.state_report_report_failed))
      return ColorManager.error.withOpacity(.54);
    else if(status==tr(LocaleKeys.state_report_report_rejected))
      return ColorManager.error.withOpacity(.64);
    else
      return ColorManager.primaryColor;
  }
  List<Color> getStatusItemColor({ required String status}) {
    if(status==tr(LocaleKeys.state_report_report_processed))
      return [Color(0xffD3BEA4), ColorManager.grey, ColorManager.grey];
    else if(status==tr(LocaleKeys.state_report_report_being_implemented))
      return [
          Color(0xffD3BEA4),
          Color(0xffBA7929).withOpacity(.68),
          ColorManager.grey
       ];
    else if(status==tr(LocaleKeys.state_report_report_implemented))
      return  [
             Color(0xffD3BEA4),
              Color(0xffBA7929).withOpacity(.68),
            Color(0xff3A8977).withOpacity(.64)
        ];
    else if(status==tr(LocaleKeys.state_report_report_failed))
      return
    [
      Color(0xffD3BEA4),
      Color(0xffBA7929).withOpacity(.68),
      ColorManager.error.withOpacity(.54)
    ];

    else if(status==tr(LocaleKeys.state_report_report_rejected))
    return  [
      Color(0xffD3BEA4),
      ColorManager.error.withOpacity(.64),
      ColorManager.grey
    ];

    else
      return [ColorManager.grey, ColorManager.grey, ColorManager.grey];
  }

  getStateNotification({ required String state})  {
    if(state==StateReports.Implemented.name)
      return  {'title':tr(LocaleKeys.notification_done_report_title),
              'subTitle':tr(LocaleKeys.notification_done_report_subTitle)};
    else if(state==StateReports.Rejected.name)
      return  {'title':tr(LocaleKeys.notification_rejected_report_title),
        'subTitle':tr(LocaleKeys.notification_rejected_report_subTitle)};
    else if(state==StateReports.Failing.name)
      return  {'title':tr(LocaleKeys.notification_fail_report_title),
        'subTitle':tr(LocaleKeys.notification_fail_report_subTitle)};
    else if(state==StateReports.Processing.name)
      return  {'title':tr(LocaleKeys.notification_accepted_report_title),
        'subTitle':tr(LocaleKeys.notification_accepted_report_subTitle)};
    else
      return  {'title':tr(LocaleKeys.notification_new_report_title),
        'subTitle':tr(LocaleKeys.notification_new_report_subTitle)};
  }

  genOrderId(){
    Random random=Random();
    String orderId='';
    for(int i=0;i<5;i++)
      orderId+='${random.nextInt(10)}';
    return orderId;
  }
}