import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/theme_manager.dart';
import 'package:lifleta/src/features/splash/presentation/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'features/auth/controller/provider/auth_provider.dart';
import 'features/auth/controller/provider/profile_provider.dart';

class LifletaApp extends StatelessWidget {
  const LifletaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,__){
        return
          MultiProvider(providers: [
        // Provider<HomeProvider>(create: (_)=>HomeProvider()),
        Provider<AuthProvider>(create: (_) => AuthProvider()),
        Provider<ProfileProvider>(create: (_)=>ProfileProvider()),
        // Provider<ProcessProvider>(create: (_)=>ProcessProvider()),
        //
        ],
          child:  MaterialApp.router(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routerConfig: goRouter,
            // routeInformationParser: goRouter.routeInformationParser,
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            theme: ThemeManager.myTheme,
          ) ,)

        ;
      },
    );


  }
}
