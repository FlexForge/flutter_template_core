import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.backgroundPrimary,
                  'Background Primary',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.backgroundSecondary,
                  'Background Secondary',
                  borderColor: context.colors.backgroundQuaternary,
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.backgroundTertiary,
                  'Background Tertiary',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.backgroundQuaternary,
                  'Background Quaternary',
                ),
              ],
            ),
            const SizedBox(height: AppLayout.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.foregroundPrimary,
                  textColor: context.colors.backgroundPrimary,
                  'Foreground Primary',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.foregroundSecondary,
                  'Foreground Secondary',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.foregroundTertiary,
                  'Foreground Tertiary',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.foregroundQuaternary,
                  'Foreground Quaternary',
                ),
              ],
            ),
            const SizedBox(height: AppLayout.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.divider,
                  'Divider',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.overlay,
                  'Overlay',
                ),
              ],
            ),
            const SizedBox(height: AppLayout.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.pink,
                  textColor: context.colors.backgroundPrimary,
                  'Pink',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.purple,
                  textColor: context.colors.backgroundPrimary,
                  'Purple',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.blue,
                  textColor: context.colors.backgroundPrimary,
                  'Blue',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.green,
                  textColor: context.colors.backgroundPrimary,
                  'Green',
                ),
              ],
            ),
            const SizedBox(height: AppLayout.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.yellow,
                  textColor: context.colors.backgroundPrimary,
                  'Yellow',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.orange,
                  textColor: context.colors.backgroundPrimary,
                  'Orange',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.red,
                  textColor: context.colors.backgroundPrimary,
                  'Red',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.teal,
                  textColor: context.colors.backgroundPrimary,
                  'Teal',
                ),
              ],
            ),
            const SizedBox(height: AppLayout.p2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorContainer(
                  context,
                  context.colors.cyan,
                  textColor: context.colors.backgroundPrimary,
                  'Cyan',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.amber,
                  textColor: context.colors.backgroundPrimary,
                  'Amber',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.indigo,
                  textColor: context.colors.backgroundPrimary,
                  'Indigo',
                ),
                const SizedBox(width: AppLayout.p2),
                _colorContainer(
                  context,
                  context.colors.magenta,
                  textColor: context.colors.backgroundPrimary,
                  'Magenta',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorContainer(
    BuildContext context,
    Color color,
    String name, {
    Color? borderColor,
    Color? textColor,
  }) {
    return Expanded(
      child: Column(
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
      ),
    );
  }
}
