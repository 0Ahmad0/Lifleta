import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:readmore/readmore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          onPressed: () {},
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
            height: 40.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(LocaleKeys.home_hello),
                      style: TextStyle(
                        fontSize: 30.sp,
                      ),
                    ),
                    FadeInUp(
                        child: Text(
                      'وَافْعَلُوا الْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ',
                      style: TextStyle(fontSize: 24.sp),
                    )),
                  ],
                ),
              ),
            ],
          ),
          HomeReportSection(),
          Expanded(
              child: CarouselSlider(
            options: CarouselOptions(
                enlargeFactor: .2,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                height: MediaQuery.of(context).size.height / 2.5),
            items: List.generate(
              10,
              (index) => ReportItem(),
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

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.black.withOpacity(.7),
                    blurRadius: 8,
                    offset: Offset(0, 6.sp),
                    spreadRadius: 2)
              ]),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.sp),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        'ارتفاع منسوب المياه ',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMEEEEd().format(
                              DateTime.now(),
                            ) +
                            ' - 1234586',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: ColorManager.grey,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(100.r),
                      ),
                    ),
                    child: Text(tr(LocaleKeys.home_current_report)),
                  )
                ],
              ),
              Container(
                  constraints: BoxConstraints(maxHeight: 120.h),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  margin: const EdgeInsets.all(AppMargin.m8),
                  decoration: BoxDecoration(
                      color: ColorManager.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: SingleChildScrollView(
                    child: ReadMoreText(
                      'يوجد طفح مياه في محطة المروى عند مسجد ابو بكر الصديق مما سبب مشكلة في الطرق وازدحام في المحطة',
                      trimCollapsedText: tr(LocaleKeys.home_more),
                      trimLines: 3,
                      trimLength: 100,
                      moreStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorManager.black),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(
                      'حي الأمير خالد',
                      style: TextStyle(color: ColorManager.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),

                          )
                        ),
                        onPressed: (){},
                        child: Text(tr(LocaleKeys.home_tracking)),
                      )),
                      const SizedBox(width: AppSize.s8,),
                      Expanded(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.grey,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),

                            )
                        ),
                        onPressed: (){},
                        child: Text(tr(LocaleKeys.home_dealy_alert),
                        style: TextStyle(
                          color: ColorManager.black
                        ),),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HomeReportSection extends StatefulWidget {
  const HomeReportSection({
    super.key,
  });

  @override
  State<HomeReportSection> createState() => _HomeReportSectionState();
}

class _HomeReportSectionState extends State<HomeReportSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8, horizontal: AppPadding.p16),
      margin: const EdgeInsets.symmetric(
          horizontal: AppMargin.m16, vertical: AppMargin.m8),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  tr(
                    LocaleKeys.home_current_reports,
                  ),
                  style: TextStyle(color: ColorManager.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  tr(
                    LocaleKeys.home_previous_reports,
                  ),
                  style: TextStyle(color: ColorManager.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
