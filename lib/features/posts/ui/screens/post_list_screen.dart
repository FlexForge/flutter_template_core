import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_core/features/posts/ui/containers/post_list.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          'Feed',
        ),
        border: null,
        padding: EdgeInsetsDirectional.zero,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: PostList(),
      ),
    );
  }
}
