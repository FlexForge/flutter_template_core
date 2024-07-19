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
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.enabled = true,
    this.expanded = false,
    super.key,
  });

  final String? label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final bool enabled;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: foregroundColor ?? context.colors.foregroundPrimary,
        backgroundColor: backgroundColor ?? context.colors.backgroundPrimary,
        disabledForegroundColor: context.colors.foregroundTertiary,
        disabledBackgroundColor: context.colors.foregroundQuaternary,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppLayout.cornerRadius),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: padding ??
            EdgeInsets.fromLTRB(
              label == null ? AppLayout.p3 : AppLayout.p4,
              AppLayout.p3,
              label == null
                  ? AppLayout.p3
                  : (icon == null ? AppLayout.p4 : AppLayout.p2),
              AppLayout.p3,
            ),
        child: Row(
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
