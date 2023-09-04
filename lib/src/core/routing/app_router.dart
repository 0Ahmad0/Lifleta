import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lifleta/src/features/home/presentation/pages/home_page.dart';
import 'package:lifleta/src/features/select_language/presentation/pages/selected_langauge_page.dart';
import 'package:page_transition/page_transition.dart';
import '/src/features/auth/presentation/pages/login_page.dart';
import '/src/features/auth/presentation/pages/sign_up_page.dart';
import '/src/features/splash/presentation/pages/splash_page.dart';
import '/src/features/not_found/no_found_page.dart';

enum AppRoute { splash, selectedLanguage, signUp, logIn ,home}

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
    GoRoute(path: '/home',
      name: AppRoute.home.name,
      builder: (context,state)=> HomePage()
    )
  ],
);
