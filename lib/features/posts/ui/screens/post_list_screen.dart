import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
import 'package:flutter_template_core/features/posts/ui/containers/post_list.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_create_screen.dart';
import 'package:go_router/go_router.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  static const routePath = '/';
  static const routeName = 'postList';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollBehavior: const CupertinoScrollBehavior(),
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Feed',
              style: TextStyle(color: context.colors.foregroundPrimary),
            ),
            trailing: IconButton(
              onPressed: () => context.goNamed(PostCreateScreen.routeName),
              icon: const Icon(
                Icons.add,
                size: 24,
              ),
            ),
            backgroundColor: context.colors.backgroundSecondary,
            border: null,
            heroTag: 'library_screen',
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(
                const Duration(milliseconds: 500),
              );
              return ref.refresh(postListControllerProvider);
            },
          ),
          const PostList(),
        ],
      ),
    );
  }
}
