import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final AppColors colors;

  CustomThemeColors({required this.colors});

  @override
  CustomThemeColors copyWith({AppColors? appColors}) => CustomThemeColors(colors: appColors ?? colors);

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) => CustomThemeColors(colors: colors);
}
