import 'package:flutter_template_core/core/utils/failure.dart';
import 'package:flutter_template_core/features/onboarding/data/db/is_first_time_entity.dart';
import 'package:fpdart/fpdart.dart';

class OnboardingRepository {
  OnboardingRepository(this.isFirstTimeDatabase);

  final IsFirstTimeData isFirstTimeDatabase;

  Either<Failure, bool> getIsFirstTime() {
    try {
      final res = isFirstTimeDatabase.get();
      if (res.isLeft()) {
        return left(const Failure.empty());
      }

      return right(res.getOrElse((_) => true));
    } catch (_) {
      return left(const Failure.unauthorized());
    }
  }

  Future<Either<Failure, bool>> setIsFirstTime({
    required bool isFirstTime,
  }) async {
    try {
      await isFirstTimeDatabase.store(isFirstTime: isFirstTime);

      return right(true);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }
}
