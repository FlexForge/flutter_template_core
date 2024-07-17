import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String title,
    required String body,
  }) = _PostModel;
}

extension ConvertPostModel on PostModel {
  Post toEntity() => Post(
        title,
        id: id,
        body: body,
        date: DateTime.now(),
      );
}
