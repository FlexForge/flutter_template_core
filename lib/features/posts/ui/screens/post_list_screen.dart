import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/posts/controllers/post_create_controller.dart';
import 'package:flutter_template_core/features/posts/ui/containers/post_list.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  static const routePath = '/';
  static const routeName = 'postList';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void create() {
      ref.read(postCreateControllerProvider.notifier).handle();
    }

    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      appBar: CupertinoNavigationBar(
        backgroundColor: context.colors.backgroundSecondary,
        middle: Text(
          'Feed',
          style: TextStyle(color: context.colors.foregroundPrimary),
        ),
        trailing:
            IconButton(onPressed: create, icon: const Icon(CupertinoIcons.add)),
        border: null,
        padding: EdgeInsetsDirectional.zero,
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: PostList(),
      ),
    );
  }
}
