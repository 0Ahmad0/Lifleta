import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_constant.dart';
import '/src/core/utils/assets_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: AppConstants.splashDelay),
            ()=>goRouter.pushReplacementNamed(AppRoute.selectedLanguage.name));
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
            )),
            const SizedBox(
              height: AppSize.s20,
            ),
            FadeInUp(
              child: SpinKitCircle(
                color: Theme.of(context).primaryColor,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
