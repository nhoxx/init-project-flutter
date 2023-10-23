import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets_analytics/features/authentication/presentation/screens/wellcome_screen.dart';

class AuthRoutes {
  static final routes = GoRoute(
    path: '/${WellcomeScreen.route}',
    builder: (BuildContext context, GoRouterState state) {
      return const WellcomeScreen();
    },
  );
}
