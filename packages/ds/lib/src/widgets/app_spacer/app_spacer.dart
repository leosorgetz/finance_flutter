import 'package:flutter/material.dart';

enum AppSpacerType { def, small, medium, large }

class AppSpacer extends StatelessWidget {
  final double height;

  const AppSpacer.def({super.key}) : height = 24.0;

  const AppSpacer.small({super.key}) : height = 8.0;

  const AppSpacer.medium({super.key}) : height = 16.0;

  const AppSpacer.large({super.key}) : height = 32.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
