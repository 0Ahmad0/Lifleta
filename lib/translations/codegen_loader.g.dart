// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "ok": "نعم",
  "an_error_occurred": "حدث خطأ غير متوقع",
  "text_filed": {
    "field_required": "هذا الحقل مطلوب"
  },
  "selected_language": {
    "how_are_we": "من نحن ؟",
    "about_us": "نبذة عنا",
    "arabic": "العربية",
    "english": "English"
  },
  "not_found": {
    "not_found": "الصفحة غير موجودة",
    "error": "404 - حدث خطأ ما!",
    "go_to_home": "الذهاب للرئيسية"
  },
  "login": {
    "login": "تسجيل الدخول",
    "id": "الرقم التعريفي",
    "enter_id": "أدخل الرقم التعريفي",
    "password": "كلمة المرور",
    "enter_Password": "أدخل كلمة المرور",
    "remember_me": "تذكرني",
    "forget_password": "نسيت كلمة المرور؟",
    "do_not_have_account": "ليس لديك حساب؟",
    "create_account": "إنشاء حساب"
  },
  "signup": {
    "signup": "إنشاء الحساب",
    "name": "الاسم",
    "enter_name": "أدخل الاسم",
    "id": "الرقم التعريفي",
    "enter_id": "أدخل الرقم التعريفي",
    "password": "كلمة المرور",
    "enter_Password": "***********",
    "confirm_password": "تأكيد كلمة المرور",
    "have_account": "هل لديك حساب؟ ",
    "login": "تسجيل الدخول",
    "less_character": "8 حروف على الأقل",
    "contain_number_and_characters": "رموز وأرقام وأحرف كبيرة"
  },
  "home": {
    "hello": "مرحباً بك...",
    "current_reports": "البلاغات الحالية",
    "current_report": "بلاغ حالي",
    "previous_report": "بلاغ سابق",
    "done_report": "تم التنفيذ",
    "previous_reports": "البلاغات السابقة",
    "tracking": "تتبع",
    "dealy_alert": "تنبيه تأخير",
    "send_report_delay_alert": "إرسال تنبيه بتأخير تنفيذ بلاغ؟",
    "send": "إرسال",
    "cancel": "إلغاء",
    "more": "المزيد...",
    "show": "عرض"
  },
  "create_report": {
    "report_subject": "موضوع البلاغ",
    "enter_report_subject": "أدخل موضوع البلاغ",
    "report_date": "تاريخ البلاغ",
    "select_report_date": "حدد تاريخ البلاغ",
    "report_description": "الوصف",
    "enter_report_description": "أدخل الوصف",
    "attachments": "مرفقات",
    "location": "الموقع",
    "select_location": "اضغط لتحديد الموقع",
    "send": "إرسال",
    "save_draft": "مسودة"
  }
};
static const Map<String,dynamic> en = {
  "ok": "Ok",
  "an_error_occurred": "An Error Occurred",
  "text_filed": {
    "field_required": "This field is required"
  },
  "not_found": {
    "not_found": "Page not found",
    "error": "404 - Page Not Found!",
    "go_to_home": "Go To Home"
  },
  "selected_language": {
    "how_are_we": "How Are We ?",
    "about_us": "About us",
    "arabic": "العربية",
    "english": "English"
  },
  "login": {
    "login": "Login",
    "id": "ID",
    "enter_id": "Enter your ID here",
    "password": "Password",
    "enter_Password": "Enter your Password here",
    "remember_me": "Remember me",
    "forget_password": "Forget password?",
    "do_not_have_account": "Don't have account?",
    "create_account": "Sign up"
  },
  "signup": {
    "signup": "Sign Up",
    "name": "NAME",
    "enter_name": "Enter your name",
    "id": "ID",
    "enter_id": "Enter your Id",
    "password": "Password",
    "enter_Password": "***********",
    "confirm_password": "Confirm password",
    "have_account": "Are you have account? ",
    "login": "Login",
    "less_character": "At least 8 characters",
    "contain_number_and_characters": "Symbols, numbers and uppercase letters"
  },
  "home": {
    "hello": "Welcome, ",
    "current_reports": "Current Reports",
    "current_report": "Current Report",
    "previous_report": "Previous Report",
    "done_report": "Report Done",
    "previous_reports": "Previous Reports",
    "tracking": "Tracking",
    "dealy_alert": "Dealy Alert",
    "send_report_delay_alert": "Send a report dealy alert ? ",
    "send": "Send",
    "cancel": "Cancel",
    "more": "More...",
    "show": "Show"
  },
  "create_report": {
    "report_subject": "Report subject",
    "enter_report_subject": "Enter report Subject",
    "report_date": "Report date",
    "select_report_date": "Select Report date",
    "report_description": "Description",
    "enter_report_description": "Enter description",
    "attachments": "Attachments",
    "location": "Location",
    "select_location": "Select Location",
    "send": "Send",
    "save_draft": "Draft"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}