import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      appBar: CupertinoNavigationBar(
        middle: const Text(
          'Feed',
        ),
        trailing:
            IconButton(onPressed: create, icon: const Icon(CupertinoIcons.add)),
        border: null,
        padding: EdgeInsetsDirectional.zero,
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: PostList(),
      ),
    );
  }
}
