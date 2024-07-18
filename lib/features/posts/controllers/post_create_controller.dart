import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_create_controller.g.dart';

@riverpod
class PostCreateController extends _$PostCreateController {
  @override
  int? build() {
    return null;
  }

  void handle(PostForm form) {
    final name = form.model.name;
    final author = form.model.author;

    if (name == null || author == null) return;

    final res = ref.read(postRepositoryProvider).createPost();
    state = res.fold((l) => throw l, (r) => r);
  }
}
