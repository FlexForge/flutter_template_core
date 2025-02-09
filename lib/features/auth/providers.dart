import 'package:flutter/widgets.dart';
import 'package:flutter_template_core/core/config/providers.dart';
import 'package:flutter_template_core/core/utils/failure.dart';
import 'package:flutter_template_core/features/auth/data/db/is_first_load_store.dart';
import 'package:flutter_template_core/features/auth/data/repositories/onboarding_repository.dart';
import 'package:flutter_template_core/features/auth/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  final prefs = ref.read(sharedPreferencesProvider).valueOrNull;

  if (prefs == null) {
    throw const Failure.internalServerError(
      message: 'Shared preferences not initialized',
    );
  }

  return OnboardingRepository(
    IsFirstLoadStore(prefs),
  );
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(store: ref.watch(objectBoxStoreProvider));
}

final isFirstLoadListener = ValueNotifier<bool>(true);
