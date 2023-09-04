import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:readmore/readmore.dart';

import '../widgets/home_report_section.dart';
import '../widgets/report_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.primaryColor,
              width: 4.sp,
            )),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: Icon(
            Icons.add,
            color: ColorManager.primaryColor,
            size: 50.sp,
          ),
          key: UniqueKey(),
          onPressed: () {
            goRouter.pushNamed(AppRoute.createReport.name);
          },
        ),
      ),
      drawer: Drawer(),
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInRight(
                child: Container(
                  width: 30.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50.r)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorManager.primaryColor,
                            ColorManager.primaryColor.withOpacity(.2),
                          ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: FadeInRightBig(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr(LocaleKeys.home_hello),
                        style: TextStyle(
                          fontSize: 30.sp,
                        ),
                      ),
                      Text(
                        'وَافْعَلُوا الْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FadeInLeft(
            child: HomeReportSection(
              currentIndex: _currentIndex,
            ),
          ),
          Expanded(
              child: FadeInUp(
                child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeFactor: .2,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.5),
                  items: List.generate(
                    10,
                        (index) =>
                        ReportItem(
                            title: 'ارتفاع منسوب المياه ',
                            reportDate: DateFormat.yMd(/*'ar_SA' arabic format*/).add_jm().format(
                              DateTime.now(),
                            ) ,
                            type: index.isEven?'done':'',
                            description: 'يوجد طفح مياه في محطة المروى عند مسجد ابو بكر الصديق مما سبب مشكلة في الطرق وازدحام في المحطة',

                            location: 'حي الأمير خالد',
                            reportId: '123846795'
                        ),
                  ),
                ),
              )),
          SizedBox(
            height: 75.h,
          )
        ],
      ),
    );
  }
}



