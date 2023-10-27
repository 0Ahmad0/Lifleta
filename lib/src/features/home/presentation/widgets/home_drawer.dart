import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/data/local/storage.dart';
import 'package:provider/provider.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../auth/controller/provider/profile_provider.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<ProfileProvider>.value(
          value: Provider.of<ProfileProvider>(context),
          child: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) =>
      Drawer(
      backgroundColor: ColorManager.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      shadowColor: ColorManager.primaryColor,
      child: Container(
        //ToDo lan en right
        margin:  EdgeInsets.only(
          left: context.locale.languageCode == 'ar'?AppMargin.m10:0.0,
          right: context.locale.languageCode == 'en'?AppMargin.m10:0.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorManager.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 130.sp,
                    height: 130.sp,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorManager.primaryColor, width: 1.5.sp),
                        shape: BoxShape.circle,
                        gradient:
                            LinearGradient(begin: Alignment.topRight, colors: [
                          ColorManager.primaryColor.withOpacity(.8),
                          ColorManager.primaryColor.withOpacity(.2),
                        ])),
                    child: Icon(Icons.person_2_outlined,size: 50.sp),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    '${profileProvider.user.name}',
                   // 'دانة منصور الحربي',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                        color: ColorManager.primaryColor),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_id),
                    icon: Icons.person_outline,
                    subTitle:'${profileProvider.user.phoneNumber}',// '54987354',
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_phone),
                    icon: Icons.phone_enabled_outlined,
                    subTitle: profileProvider.user.number??'052664855',
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_edit_profile),
                    icon: Icons.edit_outlined,
                    onTap: (){
                      goRouter.pushNamed(AppRoute.profilePage.name);
                    },
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_drafts),
                    icon: Icons.bookmark_outline_outlined,
                    onTap: (){
                      goRouter.pushNamed(AppRoute.drafts.name);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
                    decoration: BoxDecoration(
                        color: ColorManager.grey.shade300,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black.withOpacity(.4),
                            blurRadius: 4.sp,
                            offset: Offset(0, 4.sp),
                          )
                        ]),
                    child: PopupMenuButton(
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8 ),
                          leading: Icon(
                            Icons.language_outlined,
                            color: ColorManager.primaryColor,
                          ),
                          title: Text(
                            context.locale == Locale('ar')
                                ? tr(LocaleKeys.selected_language_arabic)
                                : tr(LocaleKeys.selected_language_english),
                          ),
                        ),
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            child:
                            Text(tr(LocaleKeys.selected_language_arabic)),
                            onTap: () {
                              context.setLocale(Locale('ar'));
                            },
                          ),
                          PopupMenuItem(
                            child:
                            Text(tr(LocaleKeys.selected_language_english)),
                            onTap: () {
                              context.locale = Locale('en');
                              context.setLocale(Locale('en'));
                              //  context.read<Adva>();
                            },
                          ),
                        ]),
                  ),

                  DrawerItem(
                    title: tr(LocaleKeys.drawer_log_out),
                    icon: Icons.logout,
                    onTap:() async {
                     await AppStorage.depose();
                     goRouter.pushReplacementNamed(AppRoute.selectedLanguage.name);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )));
  }
}
