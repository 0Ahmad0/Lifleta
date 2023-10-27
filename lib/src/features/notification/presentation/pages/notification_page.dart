import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/constans.dart';
import '../../../../core/data/model/models.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../auth/controller/provider/profile_provider.dart';
import '../../controller/provider/notification_provider.dart';
import '../widgets/notification_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var getNotifications;
  late NotificationProvider notificationProvider;
  getNotificationsFun()  {
    String idUser=context.read<ProfileProvider>().user.typeUser==AppConstants.collectionEmployee?
    AppConstants.collectionEmployee:context.read<ProfileProvider>().user.id;
    getNotifications = FirebaseFirestore.instance.collection(AppConstants.collectionNotification)
        .where('idUser',isEqualTo:idUser).snapshots();
    return getNotifications;
  }
  @override
  void initState() {
    notificationProvider=  Provider.of<NotificationProvider>(context,listen: false);;
    getNotificationsFun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),


      ),

      body: StreamBuilder<QuerySnapshot>(
        //prints the messages to the screen0
          stream: getNotifications,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Const.SHOWLOADINGINDECATOR();
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                Const.SHOWLOADINGINDECATOR();
                notificationProvider.notifications.listNotification.clear();
                if (snapshot.data!.docs!.length > 0) {
                  notificationProvider.notifications = Notifications.fromJson(snapshot.data!.docs!);
                }
                return
                  notificationProvider.notifications.listNotification.isEmpty?
                  Const.emptyWidget(context,text: "لا يوجد اشعارات بعد")
                      : ListView.separated(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      itemBuilder: (_,index)=>NotificationItem(
                        title: notificationProvider.notifications.listNotification[index].title,//'تم تحديث حالة البلاغ',
                        type: index.isEven?'read':'',
                        description: notificationProvider.notifications.listNotification[index].subtitle,//'ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ارتفاع في منسوب المياه ',
                      ),
                      separatorBuilder: (_,__)=>const SizedBox(height: AppSize.s20,),
                      itemCount: notificationProvider.notifications.listNotification.length
                  );
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),


    );
  }
}
