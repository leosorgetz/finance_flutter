import 'package:ds/src/themes/custom_theme_colors.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static AppColors of(BuildContext context) => Theme.of(context).extension<CustomThemeColors>()!.colors;

  late final Color primary;
  late final Color secondary;
  late final Color tertiary;
  late final Color error;
  late final Color white;
  late final Color black;
  late final Color textPrimary;
  late final Color textSecondary;
  late final Color neutral10;
  late final Color neutral20;
  late final Color neutral30;
  late final Color neutral40;
  late final Color neutral50;
  late final Color neutral60;
  late final Color neutral70;
  late final Color background;
  late final Color success;
}
