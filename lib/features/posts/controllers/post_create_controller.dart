import 'package:flutter_template_core/features/posts/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_create_controller.g.dart';

@riverpod
class PostCreateController extends _$PostCreateController {
  @override
  int? build() {
    return null;
  }

  void handle() {
    final res = ref.read(postRepositoryProvider).createPost();

    state = res.fold((l) => throw l, (r) => r);
  }
}
