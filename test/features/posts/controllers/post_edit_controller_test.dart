import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_create_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_edit_controller.dart';
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

  ProviderContainer createPostEditContainer() {
    return createContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(mockPostRepository),
      ],
    );
  }

  group('PostEditController', () {
    final mockPost = PostModel(
      id: 1,
      title: faker.randomGenerator.string(20),
      author: faker.person.name(),
    );

    test('should return post to edit on call', () {
      when(
        () => mockPostRepository.getPostById(mockPost.id.toString()),
      ).thenReturn(right(mockPost));

      final container = createPostEditContainer();
      final res =
          container.read(postEditControllerProvider(mockPost.id.toString()));

      expect(res, mockPost);
    });

    group('handle', () {
      final originalPost = PostModel(
        id: 1,
        title: faker.randomGenerator.string(20),
        author: faker.person.name(),
      );
      final mockPost = Post(
        name: faker.randomGenerator.string(20),
        author: faker.person.name(),
      );

      test('should create post when all form items are filled', () {
        final inputForm = PostForm(PostForm.formElements(mockPost), null);

        final expected = PostModel(
          id: 1,
          title: mockPost.name!,
          author: mockPost.author!,
          body: mockPost.body,
        );

        when(
          () => mockPostRepository.updatePost(
            originalPost: originalPost,
            name: mockPost.name!,
            body: mockPost.body,
            author: mockPost.author!,
          ),
        ).thenReturn(right(expected));

        final container = createPostEditContainer();
        container
            .read(
              postEditControllerProvider(originalPost.id.toString()).notifier,
            )
            .handle(inputForm, originalPost);

        final res = container
            .read(postEditControllerProvider(originalPost.id.toString()));

        expect(res, expected);
      });

      test('should return null when name is null', () {
        final inputPost = mockPost.copyWith(name: null);
        final inputForm = PostForm(PostForm.formElements(inputPost), null);

        final container = createPostEditContainer();
        container
            .read(
                postEditControllerProvider(originalPost.id.toString()).notifier)
            .handle(inputForm, originalPost);

        final res = container.read(postCreateControllerProvider);

        expect(res, null);
      });

      test('should return null when author is null', () {
        final inputPost = mockPost.copyWith(author: null);
        final inputForm = PostForm(PostForm.formElements(inputPost), null);

        final container = createPostEditContainer();
        container
            .read(
                postEditControllerProvider(originalPost.id.toString()).notifier)
            .handle(inputForm, originalPost);

        final res = container.read(postCreateControllerProvider);

        expect(res, null);
      });
    });
  });
}
