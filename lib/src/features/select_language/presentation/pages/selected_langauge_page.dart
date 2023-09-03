import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/app_string.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/style_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';

class SelectedLanguagePage extends StatelessWidget {
  const SelectedLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            FadeInRight(
              child: Image.asset(AssetsManager.logoIMG),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              AppString.appName,
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ElevatedButton(
              onPressed: () {
                goRouter.pushReplacementNamed(AppRoute.logIn.name);
              },
              child: Text(
                tr(LocaleKeys.selected_language_arabic),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ElevatedButton(
              onPressed: () {
                context.locale = Locale('ar');
                context.setLocale(Locale('ar'));
              },
              child: Text(
                tr(LocaleKeys.selected_language_english),
              ),
            ),
            const Spacer(),
            TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {
                  _showAboutUsModalBottom(context);
                },
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: tr(LocaleKeys.selected_language_how_are_we),
                      style: TextStyle(color: ColorManager.black)),
                  TextSpan(
                      text: tr(LocaleKeys.selected_language_about_us),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp))
                ])))
          ],
        ),
      ),
    );
  }

  _showAboutUsModalBottom(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        )),
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const CircleAvatar(
                    child: Icon(Icons.close),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const Text('نحن تطبيق Lifleta نهدف إلى بمكن استبدال هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص'
                          ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                          ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                          ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                          ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                          ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                          ' النص هذا النص',style: TextStyle(
                        height: 1.5
                      ),)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
