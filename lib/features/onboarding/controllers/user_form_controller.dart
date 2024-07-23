import 'package:flutter_template_core/features/onboarding/data/models/user_form_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_form_controller.g.dart';

@riverpod
class UserFormController extends _$UserFormController {
  @override
  UserForm build() {
    return UserForm(UserForm.formElements(const User()), null);
  }
}
