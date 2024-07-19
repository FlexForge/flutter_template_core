import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_edit_controller.g.dart';

@riverpod
class PostEditController extends _$PostEditController {
  @override
  PostModel build(String id) {
    final res = ref.watch(postRepositoryProvider).getPostById(id);

    return res.fold((l) => throw l, (r) => r);
  }

  void handle(PostForm form, PostModel originalPost) {
    final name = form.model.name;
    final author = form.model.author;
    final body = form.model.body;

    if (name == null || author == null) return;

    final res = ref.read(postRepositoryProvider).updatePost(
          originalPost: originalPost,
          name: name,
          author: author,
          body: body,
        );
    state = res.fold((l) => throw l, (r) => r);
  }
}
