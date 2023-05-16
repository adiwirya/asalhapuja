import 'package:flutter/material.dart';
import 'package:asalhapuja/data/utils/utils.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    required this.controller,
    super.key,
    this.done = false,
    this.obscureText = false,
    this.validate = true,
    this.maxLines = 1,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.maxLength = 100,
  });

  final TextEditingController controller;
  final bool validate;
  final bool done;
  final bool obscureText;
  final int maxLines;
  final Widget? suffixIcon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      validator: validate ? emptyValue : null,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      textInputAction: done ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: ThemeColors.gray.shade900,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
