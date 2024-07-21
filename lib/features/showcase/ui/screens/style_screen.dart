import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/showcase/ui/components/buttons.dart';
import 'package:flutter_template_core/features/showcase/ui/components/colors.dart';
import 'package:flutter_template_core/features/showcase/ui/components/forms.dart';
import 'package:flutter_template_core/features/showcase/ui/components/slidable.dart';
import 'package:flutter_template_core/features/showcase/ui/components/typography.dart';

class ShowcaseScreen extends ConsumerWidget {
  const ShowcaseScreen({super.key});

  static const routePath = '/showcase';
  static const routeName = 'showcase';

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
              'Showcase',
              style: TextStyle(color: context.colors.foregroundPrimary),
            ),
            backgroundColor: context.colors.backgroundSecondary,
            border: null,
            heroTag: 'showcase_screen',
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppLayout.p6),
                TypographyShowcase(),
                SizedBox(height: AppLayout.p3),
                ColorsShowcase(),
                SizedBox(height: AppLayout.p6),
                LargeButtonShowcase(),
                SizedBox(height: AppLayout.p3),
                FormShowcase(),
                SizedBox(height: AppLayout.p3),
                SlidableShowcase(),
                SizedBox(height: AppLayout.bottomBuffer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
