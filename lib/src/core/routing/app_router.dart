import 'package:go_router/go_router.dart';
import 'package:lifleta/src/core/data/model/models.dart';
import 'package:lifleta/src/features/create_report/presentation/pages/create_report_page.dart';
import 'package:lifleta/src/features/employee/home_employee/presentation/pages/home_employee_page.dart';
import 'package:lifleta/src/features/home/presentation/pages/home_page.dart';
import 'package:lifleta/src/features/notification/presentation/pages/notification_page.dart';
import 'package:lifleta/src/features/profile/profile_page.dart';
import 'package:lifleta/src/features/select_language/presentation/pages/selected_langauge_page.dart';
import 'package:lifleta/src/features/tracking_report/presentation/pages/tracking_report_page.dart';
import '../../features/drafts/drafts_page.dart';
import '/src/features/auth/presentation/pages/login_page.dart';
import '/src/features/auth/presentation/pages/sign_up_page.dart';
import '/src/features/splash/presentation/pages/splash_page.dart';
import '/src/features/not_found/no_found_page.dart';

enum AppRoute {
  splash,
  selectedLanguage,
  signUp,
  logIn,
  home,
  profilePageEmployee,
  createReport,
  notification,
  trackingReport,
  homeEmployee,
  drafts,
  profilePage
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const NoFoundPage(),
  routes: [
    /// [Splash Page].
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => SplashPage(),
      routes: [
        GoRoute(
          path: 'selectedLanguage',
          name: AppRoute.selectedLanguage.name,
          builder: (context, state) => SelectedLanguagePage(),
        ),
        GoRoute(
          path: 'logIn',
          name: AppRoute.logIn.name,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: 'signUp',
          name: AppRoute.signUp.name,
          builder: (context, state) => SignUpPage(),
        )
        // GoRoute(
        //     path: 'product/:id',
        //     name: AppRoute.product.name,
        //     builder: (context, state) {
        //       final productId = state.pathParameters['id']!;
        //       return Scaffold(
        //         appBar: AppBar(
        //           title: Text('${productId}'),
        //         ),
        //       );
        //       /*
        //     parmas:{'id':Product.id}
        //      */
        //     },
        //   ),
        // GoRoute(
        //     name: AppRoute.cart.name,
        //     path: 'cart',
        //     pageBuilder: (context, state) => MaterialPage(
        //       key: state.pageKey,
        //       fullscreenDialog: true,
        //       child: Scaffold(
        //         appBar: AppBar(
        //           title: Text('Cart'),
        //         ),
        //       ),
        //     ),
        //     routes: [
        //       GoRoute(
        //         path: 'checkout',
        //         name: AppRoute.checkout.name,
        //         pageBuilder: (context, state) => MaterialPage(
        //           key: state.pageKey,
        //           fullscreenDialog: true,
        //           child: Scaffold(
        //             appBar: AppBar(
        //               title: Text('Checkout'),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ]),
      ],
    ),
    GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'createReport',
            name: AppRoute.createReport.name,
            builder: (context,  state) {
              return CreateReportPage(
              report: state.extra as Report?,
            );
              },
          ),
          GoRoute(
            path: 'drafts',
            name: AppRoute.drafts.name,
            builder: (context, state) => DraftsPage(),
          ),
          GoRoute(
            path: 'profilePage',
            name: AppRoute.profilePage.name,
            builder: (context, state) => ProfilePage(),
          ),
          GoRoute(
            path: 'notification',
            name: AppRoute.notification.name,
            builder: (context, state) => NotificationPage(),
          ),
          GoRoute(
            path: 'trackingReport',
            name: AppRoute.trackingReport.name,
            builder: (context, state) => TrackingReportPage(),
          ),
        ]),
    GoRoute(
        path: '/homeEmployee',
        name: AppRoute.homeEmployee.name,
        builder: (context, state) => HomeEmployeePage(),
        routes: [

          // GoRoute(
          //   path: 'createReport',
          //   name: AppRoute.createReport.name,
          //   builder: (context, state) => CreateReportPage(),
          // ),
          // GoRoute(
          //   path: 'notification',
          //   name: AppRoute.notification.name,
          //   builder: (context, state) => NotificationPage(),
          // ),
          // GoRoute(
          //   path: 'trackingReport',
          //   name: AppRoute.trackingReport.name,
          //   builder: (context, state) => TrackingReportPage(),
          // ),
        ]),

  ],
);
