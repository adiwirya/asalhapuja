import 'package:flutter/material.dart';
import 'package:asalhapuja/data/utils/utils.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    required this.controller,
    super.key,
    this.done = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
  });

  final TextEditingController controller;
  final bool done;
  final bool obscureText;
  final int maxLines;
  final Widget? suffixIcon;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: emptyValue,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      textInputAction: done ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
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
