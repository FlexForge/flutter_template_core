import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    this.label,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.enabled = true,
    super.key,
  });

  final String? label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        foregroundColor: foregroundColor ?? context.colors.backgroundPrimary,
        backgroundColor: backgroundColor ?? context.colors.backgroundSecondary,
        disabledForegroundColor: context.colors.foregroundTertiary,
        disabledBackgroundColor: context.colors.foregroundQuaternary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppLayout.cornerRadius),
        ),
      ),
      child: Padding(
        padding: padding ??
            EdgeInsets.fromLTRB(
              label == null ? AppLayout.p3 : AppLayout.p4,
              AppLayout.p3,
              label == null ? AppLayout.p3 : AppLayout.p2,
              AppLayout.p3,
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Text(
                label!,
                style: context.typography.labelLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (icon != null && label != null)
              const SizedBox(width: AppLayout.p1),
            if (icon != null)
              Icon(
                icon,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
