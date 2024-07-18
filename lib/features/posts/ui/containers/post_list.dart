import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
import 'package:flutter_template_core/features/posts/ui/components/post_list_item.dart';
import 'package:fpdart/fpdart.dart';

class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postListControllerProvider);

    return ColoredBox(
      color: context.colors.backgroundPrimary,
      child: posts.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(4),
              child: Center(
                child: Text('No items found'),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppLayout.p6),
                ...posts.mapWithIndex(
                  (post, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          PostListItem(
                            post: post,
                            type: PostType.large,
                          ),
                          const SizedBox(height: AppLayout.p3),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        PostListItem(post: post),
                        const SizedBox(height: AppLayout.p3),
                      ],
                    );
                  },
                ),
              ],
            ),
    );
  }
}
