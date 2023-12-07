import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifleta/src/core/routing/app_router.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/color_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import 'package:lifleta/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../../../../../common_widgets/constans.dart';
import '../../../../../core/data/model/models.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../auth/controller/provider/profile_provider.dart';
import '../../../../create_report/presentation/controller/provider/report_provider.dart';
import '../widgets/home_drawer.dart';
import '../widgets/home_report_section.dart';
import '../widgets/report_item.dart';

class HomeEmployeePage extends StatefulWidget {
  const HomeEmployeePage({super.key});

  @override
  State<HomeEmployeePage> createState() => _HomeEmployeePageState();
}

class _HomeEmployeePageState extends State<HomeEmployeePage> {
  int _currentIndex = 0;
  int _rateIndex = 0;
  List<bool> _questionRate = [false, false, false, false];
  final _pageViewController = PageController(initialPage: 0);
  final refuseReportController = TextEditingController();
  final statusReportController = TextEditingController();
  List<String> _reportStatus = [
    tr(LocaleKeys.home_done_report),
    tr(LocaleKeys.home_not_done_report),
  ];

  @override
  void dispose() {
    refuseReportController.dispose();
    statusReportController.dispose();
    super.dispose();
  }


  var getReports;


  DateTime selectDate=DateTime.now();
  getReportsFun()  {
    getReports = FirebaseFirestore.instance.collection(AppConstants.collectionReport)
        .where('reportType',isEqualTo: ReportType.None.name)
        .snapshots();
    return getReports;
  }
  @override
  void initState() {
    getReportsFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logoIMG,
          width: 80.sp,
        ),
        actions: [
          IconButton(
              onPressed: () {
                goRouter.pushNamed(AppRoute.notification.name);
                // _showModalBottomHome(
                //   context,
                //   PageView(
                //     controller: _pageViewController,
                //     children: [
                //       _modalRateContent(context,question: 'مامدى رضاك عن تجربتك بشكل عام مع تطبيق Lifeleta؟',
                //         child:             StatefulBuilder(builder: (context, setStateRate) {
                //           final rateList = [
                //             AssetsManager.rate1IMG,
                //             AssetsManager.rate2IMG,
                //             AssetsManager.rate3IMG,
                //           ];
                //           return Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: List.generate(
                //                 rateList.length,
                //                     (index) => InkWell(
                //                   onTap: () {
                //                     _rateIndex = index;
                //                     setStateRate(() {});
                //                   },
                //                   child: Column(
                //                     children: [
                //                       AnimatedContainer(
                //                         width: _rateIndex == index ? 60.sp : 50.sp,
                //                         height: _rateIndex == index ? 60.sp : 50.sp,
                //                         duration: Duration(milliseconds: 300),
                //                         child: Image.asset(
                //                           rateList[index],
                //                         ),
                //                       ),
                //                       Visibility(
                //                           visible: _rateIndex == index,
                //                           child: Container(
                //                             margin: const EdgeInsets.symmetric(
                //                                 vertical: AppPadding.p8),
                //                             width: 50.w,
                //                             height: 4.sp,
                //                             decoration: BoxDecoration(
                //                                 borderRadius:
                //                                 BorderRadius.circular(10.r),
                //                                 gradient: LinearGradient(colors: [
                //                                   ColorManager.primaryColor,
                //                                   ColorManager.primaryColor
                //                                       .withOpacity(.25),
                //                                 ])),
                //                           ))
                //                     ],
                //                   ),
                //                 )),
                //           );
                //         }),
                //         buttonText: 'التالي',
                //         onTap: (){
                //         print('object');
                //         _pageViewController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                //         }
                //       ),
                //       /// ----
                //       _modalRateContent(context,question: 'بناءًا على اختيارك ماهي أهم الأسباب التي أثرت على تقييمك ؟',
                //           child:             StatefulBuilder(builder: (context, setStateRate) {
                //             final questionRateList = [
                //               'تصفح التطبيق وسهولة التنقل',
                //               'الوقت المستغرق لتنفيذ الخدمة',
                //               'إمكانية تنفيذ الخدمة من أول محاولة',
                //               'أخرى'
                //             ];
                //             return Column(
                //               children: List.generate(questionRateList.length, (index) => Container(
                //                 margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                //                 decoration: BoxDecoration(
                //                     color: ColorManager.grey.shade200,
                //                     borderRadius: BorderRadius.circular(10.r)
                //                 ),
                //                 child: ListTile(
                //                   onTap: (){
                //                     setStateRate(() {
                //                       _questionRate[index] = !_questionRate[index];
                //                     });
                //                   },
                //                   title: Text(questionRateList[index],
                //                   ),
                //                   trailing: Checkbox(
                //                     activeColor: ColorManager.primaryColor,
                //                     onChanged: (value){
                //                       setStateRate((){
                //                         _questionRate[index] = value!;
                //                       });
                //                     },
                //                     value: _questionRate[index],
                //                   ),
                //                 ),
                //               )),
                //             );
                //           }),
                //           buttonText: 'قيم',
                //         onTap: (){
                //           _pageViewController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                //         }
                //       ),
                //       /// ---
                //       _modalRateContent(context,question: 'بناءًا على اختيارك ماهي أهم الأسباب التي أثرت على تقييمك ؟',
                //           child:            Container(),
                //           buttonText: 'إغلاق',
                //         onTap: ()=> Navigator.pop(context),
                //         isShowIcon: false,
                //         finalChild: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(AssetsManager.logoIMG),
                //             const SizedBox(height: AppSize.s20,),
                //             Text('شكراً لك!',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: ColorManager.primaryColor,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 24.sp
                //             ),),
                //             const SizedBox(height: AppSize.s20,),
                //             Text('شكرًا على ملاحظاتك , ستساعدنا ملاحظاتك في تحسين خدماتنا لكم ..',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //
                //           ],
                //         )
                //       ),
                //     ],
                //   ),
                // );
              },
              icon: const Icon(
                Icons.notifications,
              )),
          IconButton(
              onPressed: () {
                _showModalBottomHome(
                  context,
                  PageView(
                    controller: _pageViewController,
                    children: [
                      _modalRateContent(context,
                          question:
                              'مامدى رضاك عن تجربتك بشكل عام مع تطبيق Lifeleta؟',
                          child:
                              StatefulBuilder(builder: (context, setStateRate) {
                            final rateList = [
                              AssetsManager.rate1IMG,
                              AssetsManager.rate2IMG,
                              AssetsManager.rate3IMG,
                            ];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  rateList.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          _rateIndex = index;
                                          setStateRate(() {});
                                        },
                                        child: Column(
                                          children: [
                                            AnimatedContainer(
                                              width: _rateIndex == index
                                                  ? 60.sp
                                                  : 50.sp,
                                              height: _rateIndex == index
                                                  ? 60.sp
                                                  : 50.sp,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: Image.asset(
                                                rateList[index],
                                              ),
                                            ),
                                            Visibility(
                                                visible: _rateIndex == index,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: AppPadding.p8),
                                                  width: 50.w,
                                                  height: 4.sp,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            ColorManager
                                                                .primaryColor,
                                                            ColorManager
                                                                .primaryColor
                                                                .withOpacity(
                                                                    .25),
                                                          ])),
                                                ))
                                          ],
                                        ),
                                      )),
                            );
                          }),
                          buttonText: 'التالي',
                      finalChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetsManager.logoIMG),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          Text(
                            'شكراً لك!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp),
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          Text(
                            'شكرًا على ملاحظاتك , ستساعدنا ملاحظاتك في تحسين خدماتنا لكم ..',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                          onTap: () {
                            print('object');
                            _pageViewController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }),

                      /// ----
                      if(context.read<ProfileProvider>().user.rate==null)...[
                      _modalRateContent(context,
                          question:
                              'بناءًا على اختيارك ماهي أهم الأسباب التي أثرت على تقييمك ؟',
                          child:
                              StatefulBuilder(builder: (context, setStateRate) {
                            final questionRateList = [
                              'تصفح التطبيق وسهولة التنقل',
                              'الوقت المستغرق لتنفيذ الخدمة',
                              'إمكانية تنفيذ الخدمة من أول محاولة',
                              'أخرى'
                            ];
                            return Column(
                              children: List.generate(
                                  questionRateList.length,
                                  (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: AppMargin.m8),
                                        decoration: BoxDecoration(
                                            color: ColorManager.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: ListTile(
                                          onTap: () {
                                            setStateRate(() {
                                              _questionRate[index] =
                                                  !_questionRate[index];
                                            });
                                          },
                                          title: Text(
                                            questionRateList[index],
                                          ),
                                          trailing: Checkbox(
                                            activeColor:
                                                ColorManager.primaryColor,
                                            onChanged: (value) {
                                              setStateRate(() {
                                                _questionRate[index] = value!;
                                              });
                                            },
                                            value: _questionRate[index],
                                          ),
                                        ),
                                      )),
                            );
                          }),
                          buttonText: 'قيم',
                          onTap: () {
                            _pageViewController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }),

                      /// ---
                      _modalRateContent(context,
                          question:
                              'بناءًا على اختيارك ماهي أهم الأسباب التي أثرت على تقييمك ؟',
                          child: Container(),
                          buttonText: 'إغلاق',
                          onTap: () => Navigator.pop(context),
                          isShowIcon: false,
                          finalChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AssetsManager.logoIMG),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              Text(
                                'شكراً لك!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorManager.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.sp),
                              ),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              Text(
                                'شكرًا على ملاحظاتك , ستساعدنا ملاحظاتك في تحسين خدماتنا لكم ..',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                      ]
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.star,
              )),
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
                      borderRadius: BorderRadius.horizontal(
                        right: context.locale.languageCode == 'en'
                            ? Radius.circular(50.r)
                            : Radius.zero,
                        left: context.locale.languageCode == 'ar'
                            ? Radius.circular(50.r)
                            : Radius.zero,
                      ),
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
              child:  FadeInUp(
          child:  ChangeNotifierProvider<ReportProvider>.value(
          value: Provider.of<ReportProvider>(context),
        child: Consumer<ReportProvider>(
            builder: (context, value, child)=>
                StreamBuilder<QuerySnapshot>(
                  //prints the messages to the screen0
                    stream: getReports,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Const.SHOWLOADINGINDECATOR();
                      } else if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else if (snapshot.hasData) {
                          _currentIndex=value.currentIndex;
                          Const.SHOWLOADINGINDECATOR();
                          value.reports.listReport.clear();
                          List<Report> currentReports=[];
                          List<Report> prevReports=[];
                          List<Report> newReports=[];
                          if (snapshot.data!.docs!.length > 0) {
                            value.reports =
                                Reports.fromJson(snapshot.data!.docs!);
                            for (Report report in value.reports.listReport) {
                              if ( report.status ==
                                  StateReports.Processing.name)
                                currentReports.add(report);
                              else  if ( [StateReports.Implemented.name,StateReports.Failing.name,StateReports.Rejected.name].contains(report.status))
                                prevReports.add(report);
                              else
                                newReports.add(report);
                            }

                          }
                          return buildReports(context,currentReports:currentReports,prevReports:prevReports, newReports: newReports);
                        } else {
                          return const Text('Empty data');
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    }))))
    ,),
          SizedBox(
            height: 75.h,
          )
        ],
      ),
    );
  }
  Widget buildReports(BuildContext context,{required List<Report> currentReports,required List<Report> prevReports,required List<Report> newReports}){
    if(_currentIndex==0)
      return
        buildListReport(context, reports: currentReports);
    else if(_currentIndex==1)
      return
        buildListReport(context, reports: prevReports);
    else
      return buildListReport(context, reports: newReports);
  }
  Widget buildListReport(BuildContext context,{required List<Report> reports})
  =>  reports.isEmpty?
  Const.emptyWidget(context,text:  tr(LocaleKeys.empty_reports))
      : CarouselSlider(
    options: CarouselOptions(
        enlargeFactor: .2,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        height: MediaQuery.of(context).size.height / 2.5),
    items: List.generate(
      reports.length,
          (index) => ReportItem(
          report: reports[index],
          title:reports[index].subject,// 'ارتفاع منسوب المياه ',
          reportDate: DateFormat.yMd(/*'ar_SA' arabic format*/)
              .add_jm()
              .format(
            reports[index].dateTime,
          ),
          type:reports[index].status, //index.isEven ? 'done' : '',
          description:
          reports[index].description,
          // 'يوجد طفح مياه في محطة المروى عند مسجد ابو بكر الصديق مما سبب مشكلة في الطرق وازدحام في المحطة',
          location: reports[index].location?.country??'',//'حي الأمير خالد',
          reportId: reports[index].numReport),
    ),
  );

  _modalRateContent(
      BuildContext context,
      {required String question,
        required Widget child,
        required String buttonText,
        VoidCallback? onTap,
        bool isShowIcon = true,
        Widget? finalChild
      }
      ) {
    return
      ChangeNotifierProvider<ProfileProvider>.value(
          value: Provider.of<ProfileProvider>(context,listen: false),
          child: Consumer<ProfileProvider>(
              builder: (context, value, childa)=>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: //isShowIcon
                        value.user.rate!=null,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close)),
                      ),
                      Visibility(
                        visible: //isShowIcon||
                        value.user.rate==null,
                        child: Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetsManager.logoIMG,
                                      width: 60.sp,
                                      height: 60.sp,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'أهلاً ${value.user.name} ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSize.s20,
                                ),
                                Text(
                                  question,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: AppSize.s30,
                                ),
                                child

                              ],
                            )),
                      ),
                      Visibility(
                          visible:  !isShowIcon||value.user.rate!=null,
                          child: Expanded(child: finalChild??SizedBox.shrink())),
                      Visibility(
                        visible:  value.user.rate==null,
                        child: TextButton(
                          onPressed: onTap,
                          child: Container(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              buttonText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )));
  }
  // Column _modalRateContent(BuildContext context,
  //     {required String question,
  //     required Widget child,
  //     required String buttonText,
  //     VoidCallback? onTap,
  //     bool isShowIcon = true,
  //     Widget? finalChild}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Visibility(
  //         visible: isShowIcon,
  //         child: IconButton(
  //             onPressed: () => Navigator.pop(context),
  //             icon: const Icon(Icons.close)),
  //       ),
  //       Visibility(
  //         visible: isShowIcon,
  //         child: Expanded(
  //             child: ListView(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(
  //                   AssetsManager.logoIMG,
  //                   width: 60.sp,
  //                   height: 60.sp,
  //                 ),
  //                 Flexible(
  //                   child: Text(
  //                     'أهلاً شذا خالد المعبدي ',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         fontSize: 24.sp,
  //                         fontWeight: FontWeight.bold,
  //                         color: ColorManager.primaryColor),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: AppSize.s20,
  //             ),
  //             Text(
  //               question,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(
  //               height: AppSize.s30,
  //             ),
  //             child
  //           ],
  //         )),
  //       ),
  //       Visibility(
  //           visible: !isShowIcon,
  //           child: Expanded(child: finalChild ?? SizedBox.shrink())),
  //       TextButton(
  //         onPressed: onTap,
  //         child: Container(
  //           padding: const EdgeInsets.all(AppPadding.p12),
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //               color: ColorManager.primaryColor,
  //               borderRadius: BorderRadius.circular(10.r)),
  //           child: Text(
  //             buttonText,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               color: ColorManager.white,
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  _showModalBottomHome(context, child) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p12),
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
        child: child,
      ),
    );
  }
}
