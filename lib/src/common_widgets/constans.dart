import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lottie/lottie.dart';

import '../core/utils/style_manager.dart';


class Const{
  static loading (BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
              alignment: Alignment.center,
              width:  MediaQuery.sizeOf(context).width  * 0.2,
              height: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(8)),
              child:
              CircularProgressIndicator(
                color: ColorManager.primaryColor,
              )
            // LoadingAnimationWidget.inkDrop(
            //     color: AppColors.primary,
            //     size: MediaQuery.sizeOf(context).width * 0.1)
          ),
        );
      },
    );
    //ToDo lock screen

  }

  static TOAST(BuildContext context, {String textToast = "This Is Toast"}) {
    showToast(
        textToast,
        context: context,
        animation: StyledToastAnimation.fadeScale,
        position: StyledToastPosition.top,
        textStyle: getRegularStyle(color: ColorManager.white)
    );
  }
  static SHOWLOADINGINDECATOR() {
    return Center(
      child: CircularProgressIndicator(
      ),
    );}

  static emptyWidget(context,{text='No Data Yet!'})=>SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AssetsManager.emptyIMG),
          Text(text,style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * 0.08,
              fontWeight: FontWeight.bold
          ),),
        ],
      ));


}