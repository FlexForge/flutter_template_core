import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/swipe_action_navigator_observer.dart';
import 'package:flutter_template_core/core/common/ui/screens/error_screen.dart';
import 'package:flutter_template_core/core/common/ui/screens/main_screen.dart';
import 'package:flutter_template_core/features/onboarding/providers.dart';
import 'package:flutter_template_core/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_create_screen.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_edit_screen.dart';
import 'package:flutter_template_core/features/user/ui/screens/profile_screen.dart';
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
      path: '/',
      name: 'home',
      builder: (context, state) => const MainScreen(),
      routes: [
        /// Post Routes
        GoRoute(
          path: PostCreateScreen.routePath,
          name: PostCreateScreen.routeName,
          builder: (context, state) => const PostCreateScreen(),
        ),
        GoRoute(
          path: PostEditScreen.routePath,
          name: PostEditScreen.routeName,
          builder: (context, state) => PostEditScreen(
            id: state.pathParameters['pid']!,
          ),
        ),

        /// User Routes
        GoRoute(
          path: ProfileScreen.routePath,
          name: ProfileScreen.routeName,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/${OnboardingScreen.routePath}',
      name: OnboardingScreen.routePath,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
  observers: [
    routeObserver,
    SwipeActionNavigatorObserver(),
  ],
  redirect: (context, state) {
    // final isFirstTime = isFirstLoadListener.value;
    // final goingToOnboard =
    //     state.matchedLocation.contains('/${OnboardingScreen.routePath}');

    // if (isFirstTime && !goingToOnboard) {
    //   return '/${OnboardingScreen.routePath}';
    // }
    // if (!isFirstTime && goingToOnboard) return '/';

    return '/${OnboardingScreen.routePath}';
  },
  refreshListenable: isFirstLoadListener,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) =>
      ErrorScreen(message: state.error.toString()),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
