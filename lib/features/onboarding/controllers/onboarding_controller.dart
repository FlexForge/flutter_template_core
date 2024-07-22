import 'package:flutter_template_core/features/onboarding/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  bool build() {
    final res = ref.watch(onboardingRepositoryProvider).getIsFirstTime();

    return res.fold((l) => throw l, (r) => r);
  }

  Future<void> setIsFirstTime({required bool isFirstTime}) async {
    final res = await ref
        .read(onboardingRepositoryProvider)
        .setIsFirstTime(isFirstTime: isFirstTime);

    state = res.fold((l) => throw l, (r) => r);
  }
}
