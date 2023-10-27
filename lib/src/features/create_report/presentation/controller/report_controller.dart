

import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/provider/report_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/constans.dart';
import '../../../../core/data/model/models.dart';
import '../../../../core/network/utils/firebase.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_constant.dart';
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
           context.read<NotificationProvider>().addNotification(context, notification:
           Notification(idUser: AppConstants.collectionEmployee, subtitle: 'add new report number ${numReport}', dateTime: DateTime.now(), title: 'New Report', message: ''));

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
      //  goRouter.pop();
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
      context.read<NotificationProvider>().addNotification(context, notification:
      Notification(idUser: report.idUser, subtitle: '${report.states} report number ${report.numReport}', dateTime: DateTime.now(), title: 'Change State Report', message: ''));

      //  goRouter.pop();
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
    var result=   context.read<NotificationProvider>().addNotification(context, notification:
    Notification(idUser: AppConstants.collectionEmployee, subtitle: 'You have notify report number ${report.numReport}', dateTime: DateTime.now(), title: 'Notify Report', message: ''));
    goRouter.pop();
    if(result['status']){

      //  goRouter.pop();
      //  goRouter.pop();
    }
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  deleteReport(context,{ required Report report}) async {
    Const.loading(context);
    await reportProvider.deleteReport(context,report: report);
     goRouter.pop();
  }

  genOrderId(){
    Random random=Random();
    String orderId='';
    for(int i=0;i<5;i++)
      orderId+='${random.nextInt(10)}';
    return orderId;
  }
}