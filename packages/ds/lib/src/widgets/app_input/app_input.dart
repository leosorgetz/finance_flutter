// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:ds/ds.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const AppInput({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.hintText,
    this.obscureText,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  FocusNode _focusNode = FocusNode();
  final _focusNodeListenable = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return ValueListenableBuilder(
      valueListenable: _focusNodeListenable,
      builder: (BuildContext context, bool isFocused, _) {
        return TextFormField(
          controller: widget.controller,
          cursorColor: colors.neutral50,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText,
            labelStyle: TextStyle(color: isFocused ? colors.primary : colors.neutral40),
          ),
          validator: widget.validator,
          obscureText: widget.obscureText ?? false,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          focusNode: _focusNode,
        );
      },
    );
  }

  void _onFocusChange() => _focusNodeListenable.value = _focusNode.hasFocus;
}
