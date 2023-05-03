import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.theme,
    required this.text,
    super.key,
    this.onPressed,
  });

  final ElevatedButtonThemeData theme;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(elevatedButtonTheme: theme),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
