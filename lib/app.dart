import 'package:flutter/material.dart';
import 'package:flutter_template_core/features/posts/ui/screens/post_list_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostListScreen(),
    );
  }
}
