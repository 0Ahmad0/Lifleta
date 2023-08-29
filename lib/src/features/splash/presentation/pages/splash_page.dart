import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/app_constant.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import '/src/core/utils/assets_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: AppConstants.splashDelay),
            ()=>goRouter.pushReplacementNamed(AppRoute.logIn.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDownBig(
              child: Image.asset(
                AssetsManager.logoIMG,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInUp(
                child: Text(
              'وَافْعَلُوا الْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ',
                  style: TextStyle(
                    fontSize: 24.sp
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
