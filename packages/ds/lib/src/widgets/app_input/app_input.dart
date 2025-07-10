import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppInput({super.key, this.label, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return TextFormField(
      controller: controller,
      cursorColor: colors.neutral50,
      decoration: InputDecoration(labelText: label),
      validator: validator,
    );
  }
}
