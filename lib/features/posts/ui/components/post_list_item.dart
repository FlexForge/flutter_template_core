import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';

enum PostType { large, wide }

class PostListItem extends StatelessWidget {
  const PostListItem({
    required this.post,
    this.type = PostType.wide,
    super.key,
  });

  final PostModel post;
  final PostType type;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        if (post.body.isNotEmpty) ...[
                          const SizedBox(
                            height: AppLayout.p2,
                          ),
                          Text(
                            post.body,
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
                  '17m ago • Alexander',
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
    );
  }
}
