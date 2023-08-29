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
    "field_required": "This field is required"
  },
  "not_found": {
    "not_found": "الصفحة غير موجودة",
    "error": "404 - حدث خطأ ما!",
    "go_to_home": "الذهاب للرئيسية"
  },
  "login": {
    "login": "تسحيل الدخول",
    "id": "الرقم التعريفي",
    "enter_id": "أدخل الرقم التعريفي",
    "password": "كلمة المرور",
    "enter_Password": "أدخل كلمة المرور",
    "remember_me": "تذكرني",
    "forget_password": "نسيت كلمة المرور؟",
    "do_not_have_account": "ليس لديك حساب؟",
    "create_account": "إنشاء حساب"
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
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
