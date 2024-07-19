import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_delete_controller.g.dart';

@riverpod
class PostDeleteController extends _$PostDeleteController {
  @override
  bool build(String id) {
    return false;
  }

  void handle() {
    final postId = int.tryParse(id);
    if (postId == null) return;

    final res = ref.watch(postRepositoryProvider).deletePost(postId);

    state = res.fold((l) => throw l, (r) => r);
  }
}
