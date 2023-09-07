import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),

      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
          itemBuilder: (_,index)=>NotificationItem(
            title: 'تم تحديث حالة البلاغ',
            type: index.isEven?'read':'',
            description: 'ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ',
          ),
          separatorBuilder: (_,__)=>const SizedBox(height: AppSize.s20,),
          itemCount: 10
      ),

    );
  }
}
