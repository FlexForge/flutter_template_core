import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Post {
  Post(
    this.title,
    this.author, {
    this.id = 0,
    this.body,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @Id()
  int id = 0;

  String title;
  String author;
  String? body;

  @Property(type: PropertyType.date)
  DateTime date;

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}

extension ConvertPost on Post {
  PostModel toModel() => PostModel(
        id: id,
        title: title,
        author: author,
        body: body,
        date: date,
      );
}
