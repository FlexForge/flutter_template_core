import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_template_core/core/common/ui/components/flex_alert_dialog.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/posts/controllers/post_delete_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_edit_screen.dart';
import 'package:go_router/go_router.dart';

enum PostType { large, wide }

class PostListItem extends ConsumerWidget {
  const PostListItem({
    required this.post,
    this.type = PostType.wide,
    super.key,
  });

  final PostModel post;
  final PostType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void deletePost() {
      ref
          .read(postDeleteControllerProvider(post.id.toString()).notifier)
          .handle();

      ref.read(postListControllerProvider.notifier).deletePost(post);

      context.pop();
    }

    return SwipeActionCell(
      key: ObjectKey(post.id),
      backgroundColor: context.colors.backgroundPrimary,
      trailingActions: [
        SwipeAction(
          content: _getIconButton(context.colors.red, Icons.delete),
          color: Colors.transparent,
          widthSpace: 64,
          onTap: (handler) async => showFlexAlertDialog(
            context,
            title: 'Delete Post',
            description: 'Are you sure you want to delete ${post.title}? '
                'This action cannot be undone.',
            onPressed: deletePost,
          ),
        ),
        SwipeAction(
          content: _getIconButton(context.colors.blue, Icons.edit),
          color: Colors.transparent,
          widthSpace: 64,
          onTap: (handler) {
            context.goNamed(
              PostEditScreen.routeName,
              pathParameters: {
                'pid': post.id.toString(),
              },
            );
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(AppLayout.cornerRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == PostType.wide)
                Padding(
                  padding: const EdgeInsets.all(AppLayout.p3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: context.typography.headlineMedium.copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                                height: 1.2,
                                color: context.colors.foregroundPrimary,
                              ),
                            ),
                            if (post.body != null && post.body!.isNotEmpty) ...[
                              const SizedBox(
                                height: AppLayout.p2,
                              ),
                              Text(
                                post.body!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: context.typography.bodySmall.copyWith(
                                  color: context.colors.foregroundSecondary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: AppLayout.p4,
                      ),
                      const SizedBox(
                        width: 100,
                        height: 100,
                        child: Placeholder(),
                      ),
                    ],
                  ),
                ),
              if (type == PostType.large) ...[
                SizedBox(
                  height: type == PostType.large ? 250 : 150,
                  child: const Placeholder(),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppLayout.p3),
                  child: Text(
                    post.title,
                    style: type == PostType.large
                        ? context.typography.headlineLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            height: 1.2,
                            color: context.colors.foregroundPrimary,
                          )
                        : context.typography.headlineMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            height: 1.2,
                            color: context.colors.foregroundPrimary,
                          ),
                  ),
                ),
                SizedBox(
                  height: type == PostType.large ? AppLayout.p4 : AppLayout.p2,
                ),
              ],
              Divider(color: context.colors.divider, height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppLayout.p3,
                  vertical: AppLayout.p1,
                ),
                child: Row(
                  children: [
                    Text(
                      '${post.timePassed()} ago • ${post.author}',
                      style: context.typography.labelSmall.copyWith(
                        color: context.colors.foregroundSecondary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: context.colors.foregroundSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconButton(Color color, IconData icon) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
