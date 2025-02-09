import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

mixin RadioListItemMixin on Widget {
  bool get selected;
  VoidCallback? get onPressed;
}

class RadioListItem extends StatelessWidget implements RadioListItemMixin {
  const RadioListItem({
    required this.name,
    required this.icon,
    this.selected = false,
    this.onPressed,
    super.key,
  });

  final String name;
  final IconData icon;

  @override
  final bool selected;
  @override
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LargeButton(
      onPressed: onPressed,
      borderColor:
          selected ? context.colors.foregroundPrimary : context.colors.divider,
      borderWidth: selected ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppLayout.p4,
          vertical: AppLayout.p6,
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: AppLayout.p3),
            Text(
              name,
              style: context.typography.bodyMedium
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
