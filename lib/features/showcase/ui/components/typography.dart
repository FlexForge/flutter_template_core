import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      header: 'Styles',
      subHeader: 'Typography',
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
            Text('Title Large', style: context.typography.titleLarge),
            const SizedBox(height: AppLayout.p2),
            Text('Title Medium', style: context.typography.titleMedium),
            const SizedBox(height: AppLayout.p2),
            Text('Title Small', style: context.typography.titleSmall),
            const SizedBox(height: AppLayout.p2),
            Text('Headline Large', style: context.typography.headlineLarge),
            const SizedBox(height: AppLayout.p2),
            Text('Headline Medium', style: context.typography.headlineMedium),
            const SizedBox(height: AppLayout.p2),
            Text('Headline Small', style: context.typography.headlineSmall),
            const SizedBox(height: AppLayout.p2),
            Text('Body Large', style: context.typography.bodyLarge),
            const SizedBox(height: AppLayout.p2),
            Text('Body Medium', style: context.typography.bodyMedium),
            const SizedBox(height: AppLayout.p2),
            Text('Body Small', style: context.typography.bodySmall),
            const SizedBox(height: AppLayout.p2),
            Text('Label Large', style: context.typography.labelLarge),
            const SizedBox(height: AppLayout.p2),
            Text('Label Medium', style: context.typography.labelMedium),
            const SizedBox(height: AppLayout.p2),
            Text('Label Small', style: context.typography.labelSmall),
            const SizedBox(height: AppLayout.p2),
            Text('Label Extra Small', style: context.typography.labelXSmall),
          ],
        ),
      ),
    );
  }
}
