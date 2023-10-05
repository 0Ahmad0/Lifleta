import 'package:flutter/material.dart';

class Const{
  static loading (context){
    // Get.dialog(
    //     Center(
    //       child: Container(
    //           alignment: Alignment.center,
    //           width: AppSizer.getW(context) * 0.2,
    //           height: AppSizer.getW(context) * 0.2,
    //           decoration: BoxDecoration(
    //               color: ColorManager.white,
    //               borderRadius: BorderRadius.circular(AppSize.s8)),
    //           child: LoadingAnimationWidget.inkDrop(
    //               color: ColorManager.primaryColor,
    //               size: AppSizer.getW(context) * 0.1)),
    //     ),
    //     barrierDismissible: false
    // );
  }
  static TOAST(BuildContext context, {String textToast = "This Is Toast"}) {
    // showToast(
    //     textToast,
    //     context: context,
    //     animation: StyledToastAnimation.fadeScale,
    //     textStyle: getRegularStyle(color: ColorManager.white)
    // );
  }

}