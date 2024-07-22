import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/user/controllers/user_info_controller.dart';
import 'package:flutter_template_core/features/user/data/models/user_model.dart';

class UserInfoCard extends ConsumerWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userInfoControllerProvider);

    return Container(
      padding: const EdgeInsets.all(AppLayout.p4),
      color: context.colors.backgroundSecondary,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: context.colors.foregroundPrimary,
            child: Text(
              '${user.firstName[0]}${user.lastName[0]}',
              style: context.typography.labelMedium.copyWith(
                color: context.colors.backgroundPrimary,
              ),
            ),
          ),
          const SizedBox(width: AppLayout.p4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: context.typography.bodyLarge.copyWith(
                  color: context.colors.foregroundPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Member since ${user.formatCreatedDate()}',
                style: context.typography.bodyMedium.copyWith(
                  color: context.colors.foregroundSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
