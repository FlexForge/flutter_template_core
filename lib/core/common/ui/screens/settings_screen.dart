import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/common/ui/components/flex_list_tile.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/auth/ui/containers/user_info_card.dart';
import 'package:flutter_template_core/features/auth/ui/screens/profile_screen.dart';
import 'package:flutter_template_core/features/system/ui/containers/theme_selector.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const routePath = '/';
  static const routeName = 'settings';

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
              'Settings',
              style: TextStyle(color: context.colors.foregroundPrimary),
            ),
            backgroundColor: context.colors.backgroundSecondary,
            border: null,
            heroTag: 'settings_screen',
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const UserInfoCard(),
                const SizedBox(height: AppLayout.p6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
                  child: Section(
                    header: 'General',
                    body: Column(
                      children: [
                        FlexListTile(
                          title: Text(
                            'Profile',
                            style: context.typography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          icon: Icons.person,
                          trailingIcon: Icons.chevron_right,
                          onTap: () => context.goNamed(ProfileScreen.routeName),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppLayout.p6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.p4),
                  child: ThemeSelector(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
