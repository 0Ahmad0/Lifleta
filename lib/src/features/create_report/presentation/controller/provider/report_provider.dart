import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifleta/src/features/notification/controller/provider/notification_provider.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widgets/constans.dart';
import '../../../../../core/data/model/models.dart';
import '../../../../../core/data/model/models.dart' as model;
import '../../../../../core/network/utils/firebase.dart';
import '../../../../../core/utils/app_constant.dart';


class ReportProvider with ChangeNotifier{
  Report report=Report.init();
  Reports reports=Reports.init();
  int currentIndex=0;

 fetchAllReport(BuildContext context) async {
   var result;
     result= await FirebaseFun.fetchReports();
     if(result['status']){
         reports=Reports.fromJson(result['body']);
     }
   return result;

 }

  addReport(BuildContext context,{required Report report,required List<File> files}) async {
   var result;

   for(File file in files){

     var url=await FirebaseFun.uploadFile2(file: file, folder: AppConstants.collectionReport);
     if(url!=null)
       report.files.add(url);
     if(report.files.length!=files.length)
       return FirebaseFun.errorUser("Fiald in upload files");
   }
   result=await FirebaseFun.addReport(report: report);
 return result;
 }
 updateReport(BuildContext context,{required Report report,required List<File> files}) async {
   var result;

   for(File file in files){
     var url=await FirebaseFun.uploadFile2(file: file, folder: AppConstants.collectionReport);
     if(url!=null)
       report.files.add(url);
     if(report.files.length!=files.length)
       return FirebaseFun.errorUser("Fiald in upload files");
   }
     result=await FirebaseFun.updateReport(report: report);
   return result;

 }
  deleteReport(context,{ required Report report}) async {
    var result;
    result =await FirebaseFun.deleteReport(report: report);
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
}
