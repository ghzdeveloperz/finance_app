import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final double total;

  const DashboardHeader({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Saldo Total', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text(
          'R\$ ${total.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
