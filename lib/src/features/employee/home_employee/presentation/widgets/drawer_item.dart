import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final String? subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
        dense: true,
        leading: Icon(
          icon,
          color: ColorManager.primaryColor,
        ),
        title: Text(title),
        subtitle: subTitle != null?Text(subTitle!):null,
      ),
    );
  }
}
