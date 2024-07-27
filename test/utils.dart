import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}

List<PostModel> generatePostModels({int count = 1}) {
  return List.generate(
    count,
    (index) => PostModel(
      id: index,
      title: faker.randomGenerator.string(20),
      body: faker.randomGenerator.string(100),
      author: faker.person.name(),
    ),
  );
}

PostModel generatePostModel({required int id}) {
  return PostModel(
    id: id,
    title: faker.randomGenerator.string(20),
    body: faker.randomGenerator.string(100),
    author: faker.person.name(),
  );
}
