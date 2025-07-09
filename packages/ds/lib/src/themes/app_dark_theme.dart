import 'package:flutter/material.dart';

import 'colors/app_colors_dark.dart';
import 'custom_theme_colors.dart';

class AppDarkTheme {
  final AppColorsDark _appColors = AppColorsDark();

  ThemeData get getTheme {
    return ThemeData(
      useMaterial3: true,
      extensions: [CustomThemeColors(colors: _appColors)],
      primaryColor: _appColors.primary,
      colorScheme: ColorScheme(
        primary: _appColors.primary,
        secondary: _appColors.secondary,
        tertiary: _appColors.tertiary,
        brightness: Brightness.dark,
        onPrimary: _appColors.white,
        onSecondary: _appColors.white,
        onError: _appColors.white,
        onSurface: _appColors.textSecondary,
        onTertiary: _appColors.white,
        error: _appColors.error,
        surface: _appColors.white,
      ),
      highlightColor: Colors.transparent,
      splashColor: _appColors.primary.withValues(alpha: 0.1),
      unselectedWidgetColor: _appColors.neutral60,
      fontFamily: 'Lato',
      iconTheme: IconThemeData(color: _appColors.textPrimary),
    );
  }
}
