import 'package:flutter_template_core/core/config/providers.dart';
import 'package:flutter_template_core/features/posts/data/repositories/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(store: ref.watch(objectBoxStoreProvider));
}
