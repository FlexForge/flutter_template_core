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

    return posts.isEmpty
        ? SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    color: context.colors.foregroundSecondary,
                    size: 48,
                  ),
                  Text(
                    'No Posts Found',
                    style: context.typography.headlineMedium.copyWith(
                      color: context.colors.foregroundSecondary,
                    ),
                  ),
                ],
              ),
            ),
          )
        : SliverToBoxAdapter(
            child: Column(
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
