import 'package:flutter_template_core/features/posts/controllers/post_create_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_edit_controller.dart';
import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_form_controller.g.dart';

@riverpod
class PostFormController extends _$PostFormController {
  @override
  PostForm build() {
    return PostForm(PostForm.formElements(const Post()), null);
  }

  void create() {
    ref.read(postCreateControllerProvider.notifier).handle(state);
  }

  void edit(PostModel post) {
    ref
        .read(postEditControllerProvider(post.id.toString()).notifier)
        .handle(state, post);
  }

  void autofillForm(PostModel post) {
    state.updateValue(
      Post(
        name: post.title,
        author: post.author,
        body: post.body,
      ),
    );
  }
}
