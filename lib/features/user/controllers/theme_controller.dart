import 'package:flutter/material.dart';
import 'package:flutter_template_core/features/user/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    final res = ref.watch(userRepositoryProvider).getUser();

    final user = res.fold(
      (l) => throw l,
      (r) => r,
    );

    return user.preferredTheme;
  }

  // Future<void> handle(ThemeMode theme) async {
  //   state = const AsyncValue.loading();

  //   final res =
  //       await ref.read(userRepositoryProvider).updateTheme(theme: theme);

  //   state = res.fold(
  //     (l) => AsyncValue.error(l.error, StackTrace.current),
  //     AsyncValue.data,
  //   );
  // }
}
