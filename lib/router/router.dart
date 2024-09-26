import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vertical_page/landing/routes.dart';
import 'package:vertical_page/router/router_handler.dart';

class AppRoutes {
  static List<RouteBase> allRoutes = [
    //define routes from module at this way
    ...LandingRoutes.routes(),
  ];

  static GoRouter router = GoRouter(
    routes: allRoutes,
    initialLocation: '/',
    errorPageBuilder: (context, state) => customTransitionBuild(Container()),
  );

  static void setupRoutes() {
    // AuthRoutes.defineRoutes(router, defineRoute);

    // router.notFoundHandler = ErrorsHandlers.notFound;
  }
}

void goTo(String path) {
  AppRoutes.router.push(path);
}
