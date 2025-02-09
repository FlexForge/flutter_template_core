import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_controller.g.dart';

@riverpod
class PostListController extends _$PostListController {
  @override
  List<PostModel> build() {
    final res = ref.watch(postRepositoryProvider).getPosts();

    return res.fold((l) => throw l, (r) => r);
  }

  void addPost(PostModel entity) {
    state = [entity, ...state];
  }

  void deletePost(PostModel entity) {
    state = state.where((e) => e.id != entity.id).toList();
  }

  void updatePost(PostModel entity) {
    final newState = [...state];
    final index = newState.indexWhere((e) => e.id == entity.id);

    if (index == -1) return;

    newState[index] = entity;
    state = newState;
  }
}
