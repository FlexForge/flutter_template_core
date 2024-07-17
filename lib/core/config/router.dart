import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/screens/error_screen.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_list_screen.dart';
import 'package:go_router/go_router.dart';

/// Main router for the Example app
///
/// ! Pay attention to the order of routes.
/// Create:  example/create
/// View:    example/:eid
/// Edit:    example/:eid/edit
/// where :edit means example entity id.
///

final router = GoRouter(
  routes: [
    GoRoute(
      path: PostListScreen.routePath,
      name: PostListScreen.routeName,
      builder: (context, state) => const PostListScreen(),
    ),
  ],
  observers: [
    routeObserver,
  ],
  debugLogDiagnostics: true,
  errorBuilder: (context, state) =>
      ErrorScreen(message: state.error.toString()),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
