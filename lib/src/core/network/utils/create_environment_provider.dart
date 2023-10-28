
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/features/create_report/presentation/controller/report_controller.dart';
import 'package:provider/provider.dart';



import '../../../../translations/locale_keys.g.dart';
import '../../../common_widgets/constans.dart';
import '../../../features/auth/controller/provider/profile_provider.dart';
import '../../../features/notification/controller/provider/notification_provider.dart';
import '../../data/model/models.dart';
import '../../data/model/models.dart' as model;
import '../../utils/app_constant.dart';
import 'firebase.dart';

class CreateEnvironmentProvider with ChangeNotifier{

  List<Report> listReport=[
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'يوجد طفح مياه في محطة المروى عند مسجد ابو بكر الصديق مما سبب مشكلة في الطرق وازدحام في المحطة',
        subject: 'ارتفاع منسوب المياه',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'حي الأمير خالد'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'إغلاق الطرق بسبب تساقط الثلوج والجليد',
        subject: 'إغلاق الطرق',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'الحميدية'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'زلزال بقوة 7 درجات يهز المدينة',
        subject: 'زلزال',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'الملك فهد'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'حريق ضخم في المبنى الحكومي',
        subject: 'حريق كبير',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'سلمانية'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'انقطاع المياه في الأحياء الشرقية',
        subject: 'انقطاع المياه',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'الغدير'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'تسرب غاز في المنطقة الصناعية يتطلب إجلاء فوري',
        subject: 'تسرب غاز',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'المصيف'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'تظاهرات سلمية تجتاح وسط المدينة',
        subject: 'احتجاجات',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'الرحمانية'),
        states: [StateReports.Suspended.name]
    ),

    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'حريق كبير في مصنع الكيماويات',
        subject: 'الحرائق',
        dateTime: DateTime.now(),
        files: ['https://firebasestorage.googleapis.com/v0/b/lifleta-b0341.appspot.com/o/Report%2FScreenshot_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A9%D9%A2%D9%A1-%D9%A1%D9%A3%D9%A0%D9%A2%D9%A2%D9%A8.png?alt=media&token=42b9ee51-c412-4364-b02b-9264c75e736a'],
        location: Location(country: 'مدينة جدة'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'تسرب غاز في المنطقة الصناعية يتطلب إجلاء فوري',
        subject: 'الطوارئ',
        dateTime: DateTime.now(),
        files:  ['https://firebasestorage.googleapis.com/v0/b/lifleta-b0341.appspot.com/o/Report%2FScreenshot_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A9%D9%A2%D9%A1-%D9%A1%D9%A3%D9%A0%D9%A2%D9%A2%D9%A8.png?alt=media&token=42b9ee51-c412-4364-b02b-9264c75e736a'],
        location: Location(country: 'الخبر'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'انقطاع المياه في الأحياء الشرقية',
        subject: 'مشكلات المياه',
        dateTime: DateTime.now(),
        files:  ['https://firebasestorage.googleapis.com/v0/b/lifleta-b0341.appspot.com/o/Report%2FScreenshot_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A9%D9%A2%D9%A1-%D9%A1%D9%A3%D9%A0%D9%A2%D9%A2%D9%A8.png?alt=media&token=42b9ee51-c412-4364-b02b-9264c75e736a'],
        location: Location(country: 'الدمام'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.None.name,
        description: 'فيضانات نتيجة الأمطار الغزيرة في وادي السيل',
        subject: 'الكوارث الطبيعية',
        dateTime: DateTime.now(),
        files:  ['https://firebasestorage.googleapis.com/v0/b/lifleta-b0341.appspot.com/o/Report%2FScreenshot_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A9%D9%A2%D9%A1-%D9%A1%D9%A3%D9%A0%D9%A2%D9%A2%D9%A8.png?alt=media&token=42b9ee51-c412-4364-b02b-9264c75e736a'],
        location: Location(country: 'منطقة الباحة'),
        states: [StateReports.Suspended.name]
    ),



    Report(status: StateReports.Suspended.name,
        reportType: ReportType.Dreft.name,
        description: 'حادث سير خطير على الطريق السريعة الدولية',
        subject: 'حادث سير',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'الورود'),
        states: [StateReports.Suspended.name]
    ),
    Report(status: StateReports.Suspended.name,
        reportType: ReportType.Dreft.name,
        description: 'انقطاع التيار الكهربائي في منطقة الشهداء',
        subject: 'مشكلة في الكهرباء',
        dateTime: DateTime.now(),
        files: [],
        location: Location(country: 'المرسلات'),
        states: [StateReports.Suspended.name]
    ),

  ];
  createReports(context) async {

    ProfileProvider profileProvider= Provider.of<ProfileProvider>(context,listen: false);
    ReportController reportController=ReportController(context: context);
    Const.loading(context);
   var result;

    for(Report report in listReport){
      report.idUser=profileProvider.user.id;
      report.numReport= reportController.genOrderId();
    result=await reportController.reportProvider.addReport(context, report: report,files: []);
    if(result['status']){
      NotificationProvider().addNotification(context, notification:
      model.Notification(idUser: AppConstants.collectionEmployee, subtitle: tr(LocaleKeys.notification_new_report_subTitle)+' ${ report.numReport}', dateTime: DateTime.now(), title: tr(LocaleKeys.notification_new_report_title), message: ''));
    }
    }

    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    goRouter.pop();
    return result;
  }

  List<User> listEmployee=[
    User(id: "",
        uid: "",
        name: "Employee",
        firstName: "Employee",
        email: "employee@gmail.com",
        phoneNumber: "11",
        number:'+9595384955',
        password: "12345678",
        typeUser: AppConstants.collectionEmployee,
        photoUrl: "", gender: 'Male', dateBirth: DateTime.now(),active: true),

    User(id: "",
        uid: "",
        name: "موظف",
        firstName: "موظف",
        email: "e@gmail.com",
        phoneNumber: "22",
        number:'+9595543355',
        password: "12345678",
        typeUser: AppConstants.collectionEmployee,
        photoUrl: "", gender: 'Male', dateBirth: DateTime.now(),active: true),
  ];
  createEmployee(context,{int indexListEmployee=0}) async {
    if(listEmployee.length<1){
      return FirebaseFun.errorUser("a user is empty");
    }
    User user=listEmployee[indexListEmployee];
    var result =await FirebaseFun.signup(email: user.email, password: user.password);
    if(result['status']){
        user.uid= result['body']?.uid;
        result = await FirebaseFun.createUser(user: user);
    }
    print(result);
    Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
    return result;
  }
  createEmployees(context) async {
    Const.loading(context);
    var result;
    if(listEmployee.length<1){
      return FirebaseFun.errorUser("a list admin is empty");
    }
    for(int i=0;i<listEmployee.length;i++){
      result =await createEmployee(context,indexListEmployee: i);
    }
    goRouter.pop();
    return result;
  }

  // List<User> listAdmin=[
  //   User(id: "",
  //       uid: "",
  //       name: "Admin",
  //       email: "admin@gmail.com",
  //       phoneNumber: "+999999999999",
  //       password: "12345678",
  //       typeUser: AppConstants.collectionAdmin,
  //       photoUrl: "", gender: 'Male', dateBirth: DateTime.now(),active: true),
  // ];
  //
  // createAdmin(context,{int indexListAdmin=0}) async {
  //   if(listAdmin.length<1){
  //     return FirebaseFun.errorUser("a user is empty");
  //   }
  //   User user=listAdmin[indexListAdmin];
  //   var result =await FirebaseFun.signup(email: user.email, password: user.password);
  //   if(result['status']){
  //       user.uid= result['body']?.uid;
  //       result = await FirebaseFun.createUser(user: user);
  //   }
  //   print(result);
  //   Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
  //   return result;
  // }
  //
  // createAdmins(context) async {
  //   Const.LOADIG(context);
  //   var result;
  //   if(listAdmin.length<1){
  //     return FirebaseFun.errorUser("a list admin is empty");
  //   }
  //   for(int i=0;i<listAdmin.length;i++){
  //     result =await createAdmin(context,indexListAdmin: i);
  //   }
  //   Get.back();
  //   return result;
  // }

  onError(error){
    print(false);
    print(error);
    return {
      'status':false,
      'message':error,
      //'body':""
    };
  }
}
