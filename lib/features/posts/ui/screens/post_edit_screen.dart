import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/posts/controllers/post_edit_controller.dart';
import 'package:flutter_template_core/features/posts/ui/forms/post_edit_form.dart';
import 'package:go_router/go_router.dart';

class PostEditScreen extends ConsumerWidget {
  const PostEditScreen({required this.id, super.key});

  final String id;

  static const routeName = 'post_edit';
  static const routePath = 'post/:pid/edit';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postEditControllerProvider(id));

    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      appBar: CupertinoNavigationBar(
        middle: Text(
          'Edit Post',
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
      body: PostEditForm(originalPost: post),
    );
  }
}
