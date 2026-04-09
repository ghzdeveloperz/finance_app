import 'package:flutter/material.dart';

class KeyboardDismissArea extends StatelessWidget {
  final Widget child;

  const KeyboardDismissArea({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}