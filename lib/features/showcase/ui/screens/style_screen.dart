import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/showcase/ui/components/typography.dart';

class ShowcaseScreen extends ConsumerWidget {
  const ShowcaseScreen({super.key});

  static const routePath = '/showcase';
  static const routeName = 'showcase';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      appBar: CupertinoNavigationBar(
        backgroundColor: context.colors.backgroundSecondary,
        middle: Text(
          'Showcase',
          style: TextStyle(color: context.colors.foregroundPrimary),
        ),
        border: null,
        padding: EdgeInsetsDirectional.zero,
      ),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            SizedBox(height: AppLayout.p3),
            TypographyShowcase(),
          ],
        ),
      ),
    );
  }
}
