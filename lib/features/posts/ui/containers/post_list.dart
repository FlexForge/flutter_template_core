import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';

class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postListControllerProvider);

    return Container(
      child: posts.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(4),
              child: Center(
                child: Text('No items found'),
              ),
            )
          : Column(
              children: [
                ...posts.map(
                  (post) => ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  ),
                ),
              ],
            ),
    );
  }
}
