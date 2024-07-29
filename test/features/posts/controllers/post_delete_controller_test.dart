import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_delete_controller.dart';
import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../utils.dart';

void main() {
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
  });

  ProviderContainer createPostDeleteContainer() {
    return createContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(mockPostRepository),
      ],
    );
  }

  group('PostDeleteController', () {
    test('should return false on call', () {
      final container = createPostDeleteContainer();
      final res = container
          .read(postDeleteControllerProvider(faker.randomGenerator.string(2)));

      expect(res, false);
    });

    group('handle', () {
      test('should delete post when id is valid', () {
        final id = faker.randomGenerator.integer(1000);

        when(
          () => mockPostRepository.deletePost(id),
        ).thenReturn(right(true));

        final container = createPostDeleteContainer();
        container
            .read(postDeleteControllerProvider(id.toString()).notifier)
            .handle();

        final res = container.read(postDeleteControllerProvider(id.toString()));

        expect(res, true);
      });

      test('should return false when id is invalid', () {
        final id = faker.randomGenerator.string(1000);

        final container = createPostDeleteContainer();
        container.read(postDeleteControllerProvider(id).notifier).handle();

        final res = container.read(postDeleteControllerProvider(id));

        expect(res, false);
      });
    });
  });
}
