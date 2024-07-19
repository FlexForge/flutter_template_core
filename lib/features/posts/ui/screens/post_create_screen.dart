import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/posts/ui/forms/post_create_form.dart';
import 'package:go_router/go_router.dart';

class PostCreateScreen extends StatelessWidget {
  const PostCreateScreen({super.key});

  static const routeName = 'post_create';

  static const routePath = 'post/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      appBar: CupertinoNavigationBar(
        middle: Text(
          'Create Post',
          style: TextStyle(color: context.colors.foregroundPrimary),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.close,
          ),
          color: context.colors.foregroundPrimary,
          iconSize: 24,
        ),
        backgroundColor: context.colors.backgroundSecondary,
        border: null,
        padding: EdgeInsetsDirectional.zero,
      ),
      body: const PostCreateForm(),
    );
  }
}
