import 'package:ds/ds.dart';
import 'package:ds/src/typography/app_typography.dart';
import 'package:flutter/material.dart';

enum AppButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool fullWidth;
  final AppButtonType type;

  const AppButton.primary({super.key, this.onPressed, required this.text, this.fullWidth = true})
    : type = AppButtonType.primary;

  const AppButton.secondary({super.key, this.onPressed, required this.text, this.fullWidth = true})
    : type = AppButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    final ElevatedButton btn = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(colors),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: AppTypography.buttonMd.copyWith(color: _getTextColor(colors))),
    );
    if (fullWidth) {
      return SizedBox(width: double.infinity, child: btn);
    }
    return btn;
  }

  Color _getBackgroundColor(AppColors colors) {
    switch (type) {
      case AppButtonType.primary:
        return colors.primary;
      case AppButtonType.secondary:
        return colors.secondary;
    }
  }

  Color _getTextColor(AppColors colors) {
    switch (type) {
      case AppButtonType.primary:
        return colors.neutral10;
      case AppButtonType.secondary:
        return colors.textPrimary;
    }
  }
}
