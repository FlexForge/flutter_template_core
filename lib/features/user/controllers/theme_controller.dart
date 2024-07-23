import 'package:flutter/material.dart';
import 'package:flutter_template_core/features/user/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    final res = ref.watch(userRepositoryProvider).getUser();

    return res.fold((l) => ThemeMode.system, (r) => r.preferredTheme);
  }

  void handle(ThemeMode theme) {
    final res = ref.read(userRepositoryProvider).updateTheme(theme: theme);

    state = res.fold((l) => throw l, (r) => r);
  }
}
