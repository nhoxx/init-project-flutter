import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/app_demo_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/wellcome_screen.dart';
import 'package:pets_analytics/routes/route_config.dart';

class AuthRoutes {
  static final routes = GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AppDemoScreen();
      },
      routes: <GoRoute>[
        GoRoute(
          path: AppDemoScreen.route,
          name: AppDemoScreen.route,
          builder: (context, state) => const AppDemoScreen(),
          pageBuilder: (context, state) =>
              RouteConfig.buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const AppDemoScreen(),
            type: 'fade',
          ),
        ),
        GoRoute(
          path: WellcomeScreen.route,
          name: WellcomeScreen.route,
          builder: (context, state) => const WellcomeScreen(),
          pageBuilder: (context, state) =>
              RouteConfig.buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const WellcomeScreen(),
            type: 'fade',
          ),
          routes: [
            GoRoute(
              path: SignUpScreen.route,
              name: SignUpScreen.route,
              builder: (context, state) => const SignUpScreen(),
              pageBuilder: (context, state) =>
                  RouteConfig.buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const SignUpScreen(),
              ),
            ),
            GoRoute(
              path: LogInScreen.route,
              name: LogInScreen.route,
              builder: (context, state) => const LogInScreen(),
              pageBuilder: (context, state) =>
                  RouteConfig.buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const LogInScreen(),
              ),
            )
          ],
        ),
      ]);
}
