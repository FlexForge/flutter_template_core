import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/theme/app_colors_extension.dart';
import 'package:flutter_template_core/core/theme/app_typography_extension.dart';
import 'package:flutter_template_core/core/theme/theme.dart';

extension BuildContextX on BuildContext {
  AppColorsExtension get colors => Theme.of(this).appColors;
  AppTextThemeExtension get typography => Theme.of(this).appTextTheme;
  ThemeData get theme => Theme.of(this);
  Size get screenSize => MediaQuery.of(this).size;
}
