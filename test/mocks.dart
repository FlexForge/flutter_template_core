import 'package:flutter_template_core/features/auth/data/repositories/onboarding_repository.dart';
import 'package:flutter_template_core/features/posts/data/repositories/post_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

class MockOnboardingRepository extends Mock implements OnboardingRepository {}
