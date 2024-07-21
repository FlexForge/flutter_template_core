import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class LargeButtonShowcase extends StatelessWidget {
  const LargeButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      header: 'Components',
      subHeader: 'Large Button',
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppLayout.p4,
          right: AppLayout.p4,
          top: AppLayout.p2,
          bottom: AppLayout.p4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LargeButton(
              onPressed: () {},
              label: 'Default Button',
              expanded: true,
            ),
            const SizedBox(height: AppLayout.p2),
            LargeButton(
              onPressed: () {},
              label: 'Default Icon Button',
              icon: Icons.chevron_right,
              expanded: true,
            ),
            const SizedBox(height: AppLayout.p2),
            LargeButton(
              onPressed: () {},
              label: 'Outlined Button',
              borderColor: context.colors.backgroundPrimary,
              backgroundColor: Colors.transparent,
              expanded: true,
            ),
            const SizedBox(height: AppLayout.p2),
            LargeButton(
              onPressed: () {},
              label: 'Ghost Button',
              borderColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              expanded: true,
            ),
            const SizedBox(height: AppLayout.p2),
            const LargeButton(
              label: 'Disabled Button',
              expanded: true,
            ),
            const SizedBox(height: AppLayout.p2),
            Wrap(
              spacing: AppLayout.p2,
              runSpacing: AppLayout.p2,
              children: [
                LargeButton(
                  onPressed: () {},
                  label: 'Label',
                ),
                LargeButton(
                  onPressed: () {},
                  label: 'Icon',
                  icon: Icons.chevron_right,
                ),
                LargeButton(
                  onPressed: () {},
                  label: 'Outline',
                  borderColor: context.colors.backgroundPrimary,
                  backgroundColor: Colors.transparent,
                ),
                LargeButton(
                  onPressed: () {},
                  label: 'Ghost',
                  borderColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                ),
                const LargeButton(
                  label: 'Disabled',
                ),
                LargeButton(
                  onPressed: () {},
                  icon: Icons.done,
                  borderRadius: AppLayout.roundedRadius,
                ),
                LargeButton(
                  onPressed: () {},
                  icon: Icons.done,
                  borderColor: context.colors.backgroundPrimary,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
