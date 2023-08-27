
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lifleta/src/features/not_found/no_found_page.dart';

enum AppRoute {
  splash,
  home,
  cart,
  product,
  leaveReview,
  checkout,
  orders,
  account,
  signIn,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const NoFoundPage(),
  routes: [
    /// [HomePage].
    GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => Scaffold(
              appBar: AppBar(),
            ),
        routes: [
          GoRoute(
              path: 'product/:id',
              name: AppRoute.product.name,
              builder: (context, state) {
                final productId = state.pathParameters['id']!;
                return Scaffold(
                  appBar: AppBar(
                    title: Text('${productId}'),
                  ),
                );
                /*
              parmas:{'id':Product.id}
               */
              },
              routes: [
                GoRoute(
                  name: AppRoute.leaveReview.name,
                  path: 'review',
                  pageBuilder: (context, state) {
                    final productId = state.pathParameters['id']!;

                    return MaterialPage(
                      key: state.pageKey,
                      fullscreenDialog: true,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text('Leave Review'),
                        ),
                      ),
                    );
                  },
                ),
              ]),
          GoRoute(
              name: AppRoute.cart.name,
              path: 'cart',
              pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('Cart'),
                      ),
                    ),
                  ),
              routes: [
                GoRoute(
                  path: 'checkout',
                  name: AppRoute.checkout.name,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('Checkout'),
                      ),
                    ),
                  ),
                ),
              ]),
          GoRoute(
            path: 'orders',
            name: AppRoute.orders.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Orders'),
                ),
              ),
            ),
          ),
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Account'),
                ),
              ),
            ),
          ),
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Sign In'),
                ),
              ),
            ),
          ),
        ]),
  ],
);
