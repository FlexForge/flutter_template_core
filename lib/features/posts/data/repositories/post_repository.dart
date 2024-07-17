import 'package:flutter_template_core/core/utils/failure.dart';
import 'package:flutter_template_core/db/objectbox.g.dart';
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:fpdart/fpdart.dart';

class PostRepository {
  PostRepository({required this.store});
  final Store store;

  Box<Post> get box => store.box<Post>();

  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final res = box.getAll();
      return right(res.map((e) => e.toModel()).toList());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }
}
