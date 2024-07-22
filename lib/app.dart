import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/config/router.dart';
import 'package:flutter_template_core/core/theme/theme.dart';
import 'package:flutter_template_core/features/user/controllers/theme_controller.dart';
import 'package:flutter_template_core/flavors.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: F.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: theme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
