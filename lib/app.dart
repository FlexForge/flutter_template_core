import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.light,
      home: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: Center(
          child: Text(
            'Hello World!',
            style: context.typography.headlineLarge.copyWith(
              color: context.colors.foregroundPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
