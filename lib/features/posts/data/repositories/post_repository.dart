import 'package:flutter_template_core/core/utils/failure.dart';
import 'package:flutter_template_core/db/objectbox.g.dart' as ob;
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:objectbox/objectbox.dart';

class PostRepository {
  PostRepository({required this.store});
  final ob.Store store;

  ob.Box<Post> get box => store.box<Post>();

  Either<Failure, List<PostModel>> getPosts() {
    try {
      final res = box
          .query()
          .order(ob.Post_.date, flags: ob.Order.descending)
          .build()
          .find();

      return right(res.map((e) => e.toModel()).toList());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }

  Either<Failure, PostModel> getPostById(String id) {
    try {
      final postId = int.tryParse(id);

      if (postId == null) {
        return left(
          const Failure.internalServerError(message: 'Id is not an integer'),
        );
      }

      final res = box.get(postId);

      if (res == null) {
        return left(const Failure.empty());
      }

      return right(res.toModel());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }

  Either<Failure, PostModel> createPost({
    required String name,
    required String author,
    String? body,
  }) {
    try {
      final postToAdd = Post(name, author, body: body);
      final id = box.put(postToAdd);

      final res = box.get(id);

      if (res == null) {
        return left(
          const Failure.internalServerError(
            message: 'Unable to fetch new post',
          ),
        );
      }

      return right(res.toModel());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }

  Either<Failure, PostModel> updatePost({
    required PostModel originalPost,
    required String name,
    required String author,
    String? body,
  }) {
    try {
      final postToUpdate = Post(
        name,
        author,
        id: originalPost.id,
        body: body,
        date: DateTime.now(),
      );
      final id = box.put(postToUpdate, mode: PutMode.update);

      final res = box.get(id);

      if (res == null) {
        return left(
          const Failure.internalServerError(
            message: 'Unable to fetch new post',
          ),
        );
      }

      return right(res.toModel());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }
}
