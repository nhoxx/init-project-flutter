import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/wellcome_screen.dart';
import 'package:pets_analytics/features/authentication/routes/auth_routes.dart';

class RouteConfig {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Route observer to use with RouteAware
  static RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/${WellcomeScreen.route}',
      navigatorKey: rootNavigatorKey,
      routes: [
        AuthRoutes.routes,
        GoRoute(
            path: '/${WellcomeScreen.route}',
            name: '/${WellcomeScreen.route}',
            builder: (context, state) {
              return const WellcomeScreen();
            }),
      ],
      observers: [
        routeObserver,
      ],
      // redirect: (context, state) {
      //   final loggedIn = authStateListenable.value;
      //   final isInLogin = state.subloc.contains('/${LoginScreen.route}');
      //   final isInSplash = state.subloc.contains('/${SplashScreen.route}');
      //   if (!loggedIn && !(isInLogin || isInSplash)) {
      //     return '/${LoginScreen.route}';
      //   }
      //   if (loggedIn && (isInLogin || isInSplash)) return '/${HomeScreen.route}';
      //   return null;
      // },
      // refreshListenable: authStateListenable,
      debugLogDiagnostics: true,
    );
  }
}
