import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../select_language/presentation/pages/selected_langauge_page.dart';
import '../../controller/splashController.dart';
import '/src/core/utils/assets_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    SplashController().init(context);
    // Future.delayed(Duration(seconds: AppConstants.splashDelay),SplashController().init(context)
    //        // ()=>goRouter.pushReplacementNamed(AppRoute.selectedLanguage.name)
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            children: [
              Center(
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



                  ],
                ),
              ),
              SelectedLanguagePage()
            ],
          ),
          Positioned(
            bottom: 20.0,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
            ),
          )
        ],
      ),
    );
  }
}
