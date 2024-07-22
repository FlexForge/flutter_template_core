import 'package:flutter_template_core/features/onboarding/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  bool build() {
    final res = ref.watch(onboardingRepositoryProvider).getIsFirstTime();

    final isFirstTime = res.fold((l) => throw l, (r) => r);

    _updateOnboardState(isFirstTime);

    return isFirstTime;
  }

  Future<void> setIsFirstTime({required bool isFirstTime}) async {
    final res = await ref
        .read(onboardingRepositoryProvider)
        .setIsFirstTime(isFirstTime: isFirstTime);

    _updateOnboardState(isFirstTime);

    state = res.fold((l) => throw l, (r) => r);
  }

  void _updateOnboardState(bool? isFirstTime) {
    onboardingListener.value = isFirstTime ?? true;
  }
}
