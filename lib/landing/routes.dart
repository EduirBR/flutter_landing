import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vertical_page/landing/page/home_page.dart';
import 'package:vertical_page/router/router_handler.dart';

class LandingRoutes {
  static List<RouteBase> routes() {
    return [
      addRoute(
        '/',
        const HomePage(),
        builder: (context, state) {
          final routeName = state.pathParameters['page'] ?? '';
          return customTransitionBuild(HomePage(
            routeName: routeName,
          ));
        },
      ),
      addRoute('/:page', const HomePage(),
          builder: (BuildContext context, GoRouterState state) {
        final routeName = state.pathParameters['page'] ?? '';
        return customTransitionBuild(HomePage(
          routeName: routeName,
        ));
      }),
    ];
  }
}
