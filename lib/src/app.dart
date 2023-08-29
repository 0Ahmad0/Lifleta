import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/theme_manager.dart';
import 'package:lifleta/src/features/splash/presentation/pages/splash_page.dart';

import 'core/routing/app_router.dart';

class LifletaApp extends StatelessWidget {
  const LifletaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,__){
        return  MaterialApp.router(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          routerConfig: goRouter,
          // routeInformationParser: goRouter.routeInformationParser,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: ThemeManager.myTheme,
        );
      },
    );


  }
}
