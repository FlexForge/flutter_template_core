import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          post.title,
          style: context.typography.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.foregroundPrimary,
          ),
        ),
        if (post.body.isNotEmpty)
          Text(
            post.body,
            style: context.typography.bodySmall.copyWith(
              color: context.colors.foregroundSecondary,
            ),
          ),
        const Divider(),
      ],
    );
  }
}
