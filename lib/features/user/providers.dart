import 'package:flutter_template_core/core/config/providers.dart';
import 'package:flutter_template_core/features/user/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(store: ref.watch(objectBoxStoreProvider));
}
