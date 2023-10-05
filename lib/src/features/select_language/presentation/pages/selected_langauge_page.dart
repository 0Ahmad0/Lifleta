import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/data/model/models.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/app_string.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/src/features/auth/controller/provider/auth_provider.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_constant.dart';

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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: PopupMenuButton(
                  child: TextButton.icon(onPressed: null, icon: const Icon(Icons.language_outlined,
                    color: ColorManager.primaryColor,
                  ), label: Text(
                      context.locale == Locale('ar')
                          ? tr(LocaleKeys.selected_language_arabic)
                          :tr(LocaleKeys.selected_language_english),
                    style: TextStyle(
                      color: ColorManager.primaryColor
                    ),
                  )),
                    itemBuilder: (_) => [
                          PopupMenuItem(
                            child: Text(tr(LocaleKeys.selected_language_arabic)),
                            onTap: (){
                              context.locale = Locale('ar');
                              context.setLocale(Locale('ar'));
                            },
                          ),
                      PopupMenuItem(
                        child: Text(tr(LocaleKeys.selected_language_english)),
                        onTap: (){
                          context.locale = Locale('en');
                          context.setLocale(Locale('en'));
                        //  context.read<Adva>();
                        },
                      ),
                        ]),
              ),
            ),
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
                context.read<AuthProvider>().typeUser=AppConstants.collectionEmployee;
                goRouter.pushReplacementNamed(AppRoute.logIn.name);
              },
              child: Text(

                tr(LocaleKeys.selected_language_login_as_employee),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().typeUser=AppConstants.collectionUser;
                goRouter.pushReplacementNamed(AppRoute.logIn.name);

              },
              child: Text(
                tr(LocaleKeys.selected_language_login_as_user),
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
                ]))),
            const SizedBox(height: 20.0,),
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
                      const Text(
                        'نحن تطبيق Lifleta نهدف إلى بمكن استبدال هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص هذا النص'
                        ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                        ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                        ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                        ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                        ' النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص النص هذا النص'
                        ' النص هذا النص',
                        style: TextStyle(height: 1.5),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
