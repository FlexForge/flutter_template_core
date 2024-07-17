import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Post {
  Post(
    this.title, {
    this.id = 0,
    this.body,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @Id()
  int id = 0;

  String title;
  String? body;

  @Property(type: PropertyType.date)
  DateTime date;

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}
