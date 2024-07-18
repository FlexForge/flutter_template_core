import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String title,
    required String author,
    String? body,
    DateTime? date,
  }) = _PostModel;
}

extension ConvertPostModel on PostModel {
  Post toEntity() => Post(
        title,
        author,
        id: id,
        body: body,
        date: date,
      );
}

extension GetTimePassed on PostModel {
  String timePassed() {
    if (date == null) return '';

    final currentTime = DateTime.now();
    final duration = currentTime.difference(date!);

    final minutes = duration.inMinutes;
    if(minutes < 60 ) return '${minutes}m';

    final hours = duration.inHours;
    if (hours < 24) return '${hours}h';

    final days = duration.inDays;
    if (days < 365) return '${days}d';

    return '${days ~/ 365}y';
  }
}
