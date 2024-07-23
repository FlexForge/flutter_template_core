import 'package:flutter_template_core/features/onboarding/data/models/user_form_model.dart';
import 'package:flutter_template_core/features/user/data/models/user_model.dart';
import 'package:flutter_template_core/features/user/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_create_controller.g.dart';

@riverpod
class UserCreateController extends _$UserCreateController {
  @override
  UserModel? build() {
    return null;
  }

  void handle(UserForm form) {
    final name = form.model.name;
    final email = form.model.email;

    if (name == null || email == null) return;

    final nameParts = name.split(' ');

    final res = ref.read(userRepositoryProvider).createUser(
          firstName: nameParts.first,
          lastName: nameParts.last,
          email: email,
        );
    state = res.fold((l) => throw l, (r) => r);
  }
}
