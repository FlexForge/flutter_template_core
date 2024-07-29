import 'package:faker/faker.dart';
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostEntity', () {
    group('extensions', () {
      test('ConvertPost', () {
        final model = PostModel(
          id: faker.randomGenerator.integer(10),
          title: faker.randomGenerator.string(20),
          author: faker.person.name(),
          body: faker.randomGenerator.string(150),
          date: faker.date.dateTime(),
        );
        final res = model.toEntity();
        final expected = Post(
          model.title,
          model.author,
          id: model.id,
          body: model.body,
          date: model.date,
        );

        expect(res.title, expected.title);
        expect(res.author, expected.author);
        expect(res.body, expected.body);
        expect(res.date, expected.date);
      });

      group('GetTimePassed', () {
        final model = PostModel(
          id: faker.randomGenerator.integer(10),
          title: faker.randomGenerator.string(20),
          author: faker.person.name(),
        );

        test('date is null', () {
          final noDateModel = model;
          final timePassed = noDateModel.timePassed();

          expect(timePassed, '');
        });

        test('date is less then a minute ago', () {
          final recentDateModel = model.copyWith(date: DateTime.now());
          final timePassed = recentDateModel.timePassed();

          expect(timePassed, 'seconds');
        });

        test('date is less than an hour ago', () {
          final minutesPassed = faker.randomGenerator.integer(59, min: 2);
          final minuteDateModel = model.copyWith(
            date: DateTime.now().subtract(Duration(minutes: minutesPassed)),
          );
          final timePassed = minuteDateModel.timePassed();

          expect(timePassed, '${minutesPassed}m');
        });

        test('date is less than a dat ago', () {
          final hoursPassed = faker.randomGenerator.integer(23, min: 2);
          final minuteDateModel = model.copyWith(
            date: DateTime.now().subtract(Duration(hours: hoursPassed)),
          );
          final timePassed = minuteDateModel.timePassed();

          expect(timePassed, '${hoursPassed}h');
        });

        test('date is less than a year ago', () {
          final daysPassed = faker.randomGenerator.integer(364);
          final minuteDateModel = model.copyWith(
            date: DateTime.now().subtract(Duration(days: daysPassed)),
          );
          final timePassed = minuteDateModel.timePassed();

          expect(timePassed, '${daysPassed}d');
        });

        test('date is over a year ago', () {
          final daysPassed = faker.randomGenerator.integer(1000, min: 366);
          final minuteDateModel = model.copyWith(
            date: DateTime.now().subtract(Duration(days: daysPassed)),
          );
          final timePassed = minuteDateModel.timePassed();

          expect(timePassed, '${daysPassed ~/ 365}y');
        });
      });
    });
  });
}
