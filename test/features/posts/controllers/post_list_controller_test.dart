import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
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

  ProviderContainer createPostListContainer() {
    return createContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(mockPostRepository),
      ],
    );
  }

  group('PostListController', () {
    test('should return list of posts on call', () {
      final mockList = generatePostModels(count: 5);
      when(() => mockPostRepository.getPosts()).thenReturn(right(mockList));

      final container = createPostListContainer();
      final res = container.read(postListControllerProvider);

      expect(res.length, 5);
      expect(res, mockList);
    });

    test('should add post to list', () {
      final mockList = generatePostModels(count: 2);
      final mockPost = generatePostModel(id: 4);

      when(() => mockPostRepository.getPosts()).thenReturn(right(mockList));

      final container = createPostListContainer();
      container.read(postListControllerProvider.notifier).addPost(mockPost);

      final res = container.read(postListControllerProvider);

      expect(res.length, 3);
      expect(res.first, mockPost);
    });

    test('should delete post from list', () {
      final mockList = generatePostModels(count: 5);

      when(() => mockPostRepository.getPosts()).thenReturn(right(mockList));

      final container = createPostListContainer();
      container
          .read(postListControllerProvider.notifier)
          .deletePost(mockList.first);

      final res = container.read(postListControllerProvider);

      expect(res.length, 4);
      expect(res.first, isNot(mockList.first));
    });

    test('should update post in list', () {
      final id = faker.randomGenerator.integer(4);
      final mockList = generatePostModels(count: 5);
      final mockPost = generatePostModel(id: id);

      when(() => mockPostRepository.getPosts()).thenReturn(right(mockList));

      final container = createPostListContainer();
      container.read(postListControllerProvider.notifier).updatePost(mockPost);

      final res = container.read(postListControllerProvider);

      expect(res.length, 5);
      expect(res[id], mockPost);
    });
  });
}
