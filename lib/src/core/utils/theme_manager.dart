import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(255, 0, 100, .1),
  100: Color.fromRGBO(255, 0, 100, .2),
  200: Color.fromRGBO(255, 0, 100, .3),
  300: Color.fromRGBO(255, 0, 100, .4),
  400: Color.fromRGBO(255, 0, 100, .5),
  500: Color.fromRGBO(255, 0, 100, .6),
  600: Color.fromRGBO(255, 0, 100, .7),
  700: Color.fromRGBO(255, 0, 100, .8),
  800: Color.fromRGBO(255, 0, 100, .9),
  900: Color.fromRGBO(255, 0, 100, 1),
};

class ThemeManager {
  static var myTheme = ThemeData(
      dividerColor: ColorManager.white,
      primarySwatch: MaterialColor(ColorManager.primaryColor.value, color),
      primaryColor: ColorManager.primaryColor,
      iconTheme: const IconThemeData(
        color: ColorManager.primaryColor,
      ),
      primaryColorLight: ColorManager.primaryColor,
      primaryIconTheme: const IconThemeData(color: ColorManager.primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
              color: ColorManager.white,
            ),
            minimumSize: const Size(double.infinity, AppSize.s60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8))),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.white,
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle:
              getRegularStyle(color: ColorManager.black, fontSize: 14.sp)),
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor);
}
