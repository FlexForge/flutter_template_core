import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_colors.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    Widget colorContainer(
      Color color,
      String name, {
      Color? borderColor,
      Color? textColor,
    }) {
      return Column(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? context.colors.backgroundSecondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(AppLayout.cornerRadius),
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppLayout.cornerRadius),
            ),
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppLayout.p1),
                child: Text(
                  name,
                  style: context.typography.labelXSmall.copyWith(
                    color: textColor ?? context.colors.foregroundPrimary,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Section(
      subHeader: 'Colors',
      padding: const EdgeInsets.symmetric(
        horizontal: AppLayout.p4,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppLayout.p4,
          right: AppLayout.p4,
          top: AppLayout.p2,
          bottom: AppLayout.p4,
        ),
        child: LayoutGrid(
          columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
          rowSizes: const [auto, auto, auto, auto, auto, auto],
          rowGap: AppLayout.p2, // equivalent to mainAxisSpacing
          columnGap: AppLayout.p2,
          children: [
            colorContainer(
              context.colors.backgroundPrimary,
              'Background Primary',
            ),
            colorContainer(
              context.colors.backgroundSecondary,
              'Background Secondary',
              borderColor: context.colors.backgroundQuaternary,
            ),
            colorContainer(
              context.colors.backgroundTertiary,
              'Background Tertiary',
            ),
            colorContainer(
              context.colors.backgroundQuaternary,
              'Background Quaternary',
            ),
            colorContainer(
              context.colors.foregroundPrimary,
              'Foreground Primary',
              textColor: context.colors.backgroundPrimary,
            ),
            colorContainer(
              context.colors.foregroundSecondary,
              'Foreground Secondary',
            ),
            colorContainer(
              context.colors.foregroundTertiary,
              'Foreground Tertiary',
            ),
            colorContainer(
              context.colors.foregroundQuaternary,
              'Foreground Quaternary',
            ),
            colorContainer(
              context.colors.divider,
              'Divider',
            ).withGridPlacement(columnSpan: 2),
            colorContainer(
              context.colors.overlay,
              'Overlay',
            ).withGridPlacement(columnSpan: 2),
            colorContainer(
              context.colors.pink,
              'Pink',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.purple,
              'Purple',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.blue,
              'Blue',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.green,
              'Green',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.yellow,
              'Yellow',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.orange,
              'Orange',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.red,
              'Red',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.teal,
              'Teal',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.cyan,
              'Cyan',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.lime,
              'Lime',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.indigo,
              'Indigo',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
            colorContainer(
              context.colors.magenta,
              'magenta',
              textColor: AppColors.lightModeColors.foregroundPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
