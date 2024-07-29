import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_form_controller.dart';
import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

void main() {
  ProviderContainer createPostFormContainer() {
    return createContainer();
  }

  group('PostFormController', () {
    test('autofillForm', () {
      final mockPost = PostModel(
        id: 1,
        title: faker.randomGenerator.string(20),
        author: faker.person.name(),
      );

      final container = createPostFormContainer();
      container
          .read(postFormControllerProvider.notifier)
          .autofillForm(mockPost);

      final res = container.read(postFormControllerProvider);

      expect(
        res.model,
        Post(name: mockPost.title, author: mockPost.author),
      );
    });
  });
}
