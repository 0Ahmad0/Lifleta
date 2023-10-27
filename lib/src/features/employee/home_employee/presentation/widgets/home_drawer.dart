import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../translations/locale_keys.g.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    'دانة منصور الحربي',
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
                    subTitle: '54987354',
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_phone),
                    icon: Icons.phone_enabled_outlined,
                    subTitle: '052664855',
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_edit_profile),
                    icon: Icons.edit_outlined,
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_drafts),
                    icon: Icons.bookmark_outline_outlined,
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_change_language),
                    icon: Icons.language_outlined,
                  ),
                  DrawerItem(
                    title: tr(LocaleKeys.drawer_log_out),
                    icon: Icons.logout,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
