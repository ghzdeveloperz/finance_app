import 'package:flutter/material.dart';

class TransactionDateGroup extends StatelessWidget {
  final String label;
  final Widget child;

  const TransactionDateGroup({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        child,
      ],
    );
  }
}
