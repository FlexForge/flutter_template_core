import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class FlexListTile extends StatelessWidget {
  const FlexListTile({
    required this.title,
    this.subtitle,
    this.icon,
    this.trailingIcon,
    this.onTap,
    this.actionButtons,
    this.foregroundColor,
    this.disabledForegroundColor,
    this.backgroundColor = Colors.transparent,
    this.prefix,
    this.suffix,
    super.key,
  });

  final void Function()? onTap;

  final List<Widget>? actionButtons;

  final Widget title;
  final Widget? subtitle;

  final IconData? icon;
  final IconData? trailingIcon;
  final Widget? prefix;
  final Widget? suffix;

  final Color? foregroundColor;
  final Color? disabledForegroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor ?? context.colors.foregroundPrimary,
        disabledForegroundColor:
            disabledForegroundColor ?? context.colors.foregroundSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.cornerRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppLayout.p3,
          top: AppLayout.p2,
          bottom: AppLayout.p2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  if (prefix == null)
                    Icon(
                      icon ?? Icons.brightness_1,
                      weight: icon != null ? 400 : 700,
                      size: 30,
                    ),
                  if (prefix != null)
                    SizedBox(
                      width: 30,
                      child: prefix,
                    ),
                  const SizedBox(width: AppLayout.p3),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: actionButtons != null ? 0 : AppLayout.p2,
                              bottom: actionButtons != null && subtitle == null
                                  ? 0
                                  : AppLayout.p2,
                              right: AppLayout.p4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                title,
                                const SizedBox(height: 2),
                                if (subtitle != null) subtitle!,
                              ],
                            ),
                          ),
                        ),
                        if (suffix != null)
                          Padding(
                            padding: const EdgeInsets.only(right: AppLayout.p2),
                            child: suffix,
                          ),
                        if (trailingIcon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: AppLayout.p2),
                            child: Icon(
                              trailingIcon,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (actionButtons != null)
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: actionButtons!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
