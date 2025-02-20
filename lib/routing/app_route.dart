import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/screens/address_screen.dart';
import 'package:flutter_firebase/screens/login_screen.dart';
import 'package:flutter_firebase/screens/sign_up_screen.dart';
import 'package:flutter_firebase/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppRoute {
  /// Auth Screen routes
  splashScreen,
  loginScreen,
  signUpScreen,
  addressScreen,
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      observers: [],
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      redirect: (context, state) async {
        log('from-redirect: ${state.fullPath}');
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: AppRoute.splashScreen.name,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/${AppRoute.loginScreen.name}',
          name: AppRoute.loginScreen.name,
          builder: (context, state) => LoginScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: '/${AppRoute.signUpScreen.name}',
              name: AppRoute.signUpScreen.name,
              builder: (context, state) => const SignUpScreen(),
            ),
            GoRoute(
              path: AppRoute.addressScreen.name,
              name: AppRoute.addressScreen.name,
              builder: (context, state) => const AddressScreen(),
            ),
          ],
        ),
      ],
    );
  },
);
