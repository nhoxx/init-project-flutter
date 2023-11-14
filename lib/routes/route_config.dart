import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/app_demo_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/pet_profile_screen.dart';
import 'package:pets_analytics/features/authentication/routes/auth_routes.dart';

class RouteConfig {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Route observer to use with RouteAware
  static RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/${AppDemoScreen.route}',
      navigatorKey: rootNavigatorKey,
      routes: [
        AuthRoutes.routes,
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

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    String? type,
  }) {
    return CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              const begin = Offset(1.0, 0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
          }
        });
  }
}
