import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import '/src/features/an_error_occurred/an_error_occurred_page.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'translations/codegen_loader.g.dart';
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await runZonedGuarded(() async {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) =>  runApp(
      EasyLocalization(
        path: 'assets/translations/',
        supportedLocales: [
          Locale("en"),
          Locale("ar"),
        ],
        fallbackLocale: Locale(/*Get.deviceLocale?.languageCode ?? */'en'),
        assetLoader: CodegenLoader(),
        // child: MyApp(),
        child: LifletaApp(),
      ),
    ));
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return AnErrorOccurredPage(details: details.toStringShort(),);
    };
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });


}
/*

flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
./gradlew signingReport ///SH1
temp@gmail.com   123456
flutter pub run build_runner watch --delete-conflicting-outputs
 */