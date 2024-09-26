import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

RouteBase addRoute(String path, Widget view,
    {String? name, GoRouterPageBuilder? builder}) {
  return GoRoute(
    name: name,
    path: path,
    // builder: (context, state) => view, // this is the default way
    pageBuilder: builder ??
        (context, state) {
          return customTransitionBuild(view);
        },
  );
}

///Transition build if needed
CustomTransitionPage<dynamic> customTransitionBuild(Widget view) {
  return CustomTransitionPage(
      child: view, //view is the widget to show
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      });
}
