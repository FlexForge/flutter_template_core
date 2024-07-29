import 'package:faker/faker.dart';
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostEntity', () {
    test('should return current time if date is not provided', () {
      final entity = Post(
        faker.randomGenerator.string(20),
        faker.person.name(),
        body: faker.randomGenerator.string(150),
      );

      expect(entity.date.day, DateTime.now().day);
    });

    group('extensions', () {
      test('ConvertPost', () {
        final entity = Post(
          faker.randomGenerator.string(20),
          faker.person.name(),
          body: faker.randomGenerator.string(150),
          date: faker.date.dateTime(),
        );
        final res = entity.toModel();

        expect(
          res,
          PostModel(
            id: 0,
            title: entity.title,
            author: entity.author,
            body: entity.body,
            date: entity.date,
          ),
        );
      });
    });
  });
}
