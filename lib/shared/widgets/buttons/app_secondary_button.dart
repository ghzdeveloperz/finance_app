import 'package:flutter/material.dart';

class AppSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}