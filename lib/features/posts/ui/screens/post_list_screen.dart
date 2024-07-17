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
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollBehavior: const CupertinoScrollBehavior(),
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Feed',
              style: TextStyle(color: context.colors.foregroundPrimary),
            ),
            backgroundColor: context.colors.backgroundSecondary,
            border: null,
            heroTag: 'library_screen',
          ),
          const SliverToBoxAdapter(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
