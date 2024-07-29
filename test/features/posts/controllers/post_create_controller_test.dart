import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_create_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
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

  ProviderContainer createPostCreateContainer() {
    return createContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(mockPostRepository),
      ],
    );
  }

  group('PostCreateController', () {
    test('should return null on call', () {
      final container = createPostCreateContainer();
      final res = container.read(postCreateControllerProvider);

      expect(res, null);
    });

    group('handle', () {
      test('should create post when all form items are filled', () {
        const mockPost = Post(name: 'name', body: 'body', author: 'author');
        final inputForm = PostForm(PostForm.formElements(mockPost), null);

        when(
          () => mockPostRepository.createPost(
            name: mockPost.name!,
            body: mockPost.body,
            author: mockPost.author!,
          ),
        ).thenReturn(
          right(
            PostModel(
              id: 1,
              title: mockPost.name!,
              author: mockPost.author!,
              body: mockPost.body,
            ),
          ),
        );

        final container = createPostCreateContainer();
        container.read(postCreateControllerProvider.notifier).handle(inputForm);

        final res = container.read(postCreateControllerProvider);
      });
    });
  });
}
