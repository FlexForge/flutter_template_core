import 'package:flutter_template_core/features/auth/data/models/user_model.dart';
import 'package:flutter_template_core/features/auth/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_controller.g.dart';

@riverpod
class UserInfoController extends _$UserInfoController {
  @override
  UserModel build() {
    final res = ref.watch(userRepositoryProvider).getUser();

    return res.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
