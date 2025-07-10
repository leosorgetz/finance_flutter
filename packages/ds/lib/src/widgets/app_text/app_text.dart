import 'package:flutter/material.dart';

import '../../typography/app_typography.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextStyle? customTextStyle;

  const AppText.titleLg(this.text, {super.key, this.customTextStyle}) : style = AppTypography.titleLg;

  const AppText.titleMd(this.text, {super.key, this.customTextStyle}) : style = AppTypography.titleMd;

  const AppText.titleSm(this.text, {super.key, this.customTextStyle}) : style = AppTypography.titleSm;

  const AppText.titleXs(this.text, {super.key, this.customTextStyle}) : style = AppTypography.titleXs;

  const AppText.title2xs(this.text, {super.key, this.customTextStyle}) : style = AppTypography.title2xs;

  const AppText.textSm(this.text, {super.key, this.customTextStyle}) : style = AppTypography.textSm;

  const AppText.textXs(this.text, {super.key, this.customTextStyle}) : style = AppTypography.textXs;

  const AppText.input(this.text, {super.key, this.customTextStyle}) : style = AppTypography.input;

  const AppText.buttonMd(this.text, {super.key, this.customTextStyle}) : style = AppTypography.buttonMd;

  const AppText.buttonSm(this.text, {super.key, this.customTextStyle}) : style = AppTypography.buttonSm;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style.merge(customTextStyle));
  }
}
