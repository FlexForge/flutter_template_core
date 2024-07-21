import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter_template_core/core/common/ui/components/flex_list_tile.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/posts/ui/components/post_list_item.dart';

class SlidableShowcase extends StatelessWidget {
  const SlidableShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      subHeader: 'Slidable List',
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppLayout.p2,
          bottom: AppLayout.p4,
        ),
        child: Column(
          children: [
            SwipeActionCell(
              key: const ObjectKey('single-action'),
              backgroundColor: context.colors.backgroundSecondary,
              trailingActions: <SwipeAction>[
                SwipeAction(
                  title: 'Action 1',
                  icon: const Icon(
                    Icons.delete,
                    size: 20,
                  ),
                  style: context.typography.labelSmall,
                  onTap: (CompletionHandler handler) async {},
                  color: context.colors.red,
                ),
              ],
              child: FlexListTile(
                title: Text(
                  'Single Action',
                  style: context.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'You can have a single action',
                  style: context.typography.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colors.foregroundSecondary,
                  ),
                ),
                prefix: Center(
                  child: Text(
                    '1',
                    style: context.typography.headlineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailingIcon: Icons.swipe_left,
                onTap: () => {},
              ),
            ),
            Divider(
              indent: 54,
              height: 1,
              thickness: 1,
              color: context.colors.divider,
            ),
            SwipeActionCell(
              key: const ObjectKey('multi-action'),
              backgroundColor: context.colors.backgroundSecondary,
              leadingActions: [
                SwipeAction(
                  title: 'Action 1',
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  style: context.typography.labelSmall,
                  onTap: (CompletionHandler handler) async {},
                  color: context.colors.green,
                ),
                SwipeAction(
                  title: 'Action 2',
                  icon: const Icon(
                    Icons.star,
                    size: 20,
                  ),
                  style: context.typography.labelSmall,
                  onTap: (CompletionHandler handler) async {},
                  color: context.colors.orange,
                ),
              ],
              trailingActions: <SwipeAction>[
                SwipeAction(
                  title: 'Action 4',
                  icon: const Icon(
                    Icons.delete,
                    size: 20,
                  ),
                  style: context.typography.labelSmall,
                  onTap: (CompletionHandler handler) async {},
                  color: context.colors.red,
                ),
                SwipeAction(
                  title: 'Action 3',
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  style: context.typography.labelSmall,
                  onTap: (CompletionHandler handler) async {},
                  color: context.colors.blue,
                ),
              ],
              child: FlexListTile(
                title: Text(
                  'Multi Actions',
                  style: context.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'You can multiple leading and trailing actions',
                  style: context.typography.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colors.foregroundSecondary,
                  ),
                ),
                prefix: Center(
                  child: Text(
                    '2',
                    style: context.typography.headlineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailingIcon: Icons.swipe,
                onTap: () => {},
              ),
            ),
            Divider(
              indent: 54,
              height: 1,
              thickness: 1,
              color: context.colors.divider,
            ),
            SwipeActionCell(
              key: const ObjectKey('custom-actions'),
              backgroundColor: context.colors.backgroundSecondary,
              trailingActions: [
                SwipeAction(
                  content: getIconButton(context.colors.red, Icons.delete),
                  color: Colors.transparent,
                  widthSpace: 64,
                  onTap: (handler) async => {},
                ),
                SwipeAction(
                  content: getIconButton(context.colors.blue, Icons.edit),
                  color: Colors.transparent,
                  widthSpace: 64,
                  onTap: (handler) {},
                ),
              ],
              child: FlexListTile(
                title: Text(
                  'Custom Actions',
                  style: context.typography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'You can customize the look of the actions',
                  style: context.typography.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colors.foregroundSecondary,
                  ),
                ),
                prefix: Center(
                  child: Text(
                    '3',
                    style: context.typography.headlineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailingIcon: Icons.swipe_left,
                onTap: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
