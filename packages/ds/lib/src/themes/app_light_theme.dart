import 'package:ds/src/themes/colors/app_colors_light.dart';
import 'package:ds/src/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_theme_colors.dart';

class AppLightTheme {
  final AppColorsLight _appColors = AppColorsLight();

  ThemeData get getTheme {
    return ThemeData(
      useMaterial3: true,
      extensions: [CustomThemeColors(colors: _appColors)],
      primaryColor: _appColors.primary,
      colorScheme: ColorScheme(
        primary: _appColors.primary,
        secondary: _appColors.secondary,
        tertiary: _appColors.tertiary,
        brightness: Brightness.light,
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
      textTheme: GoogleFonts.latoTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTypography.input,
        focusColor: _appColors.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _appColors.neutral30, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _appColors.neutral40, width: 1),
        ),
        filled: true,
        fillColor: _appColors.neutral20,
      ),
    );
  }
}
