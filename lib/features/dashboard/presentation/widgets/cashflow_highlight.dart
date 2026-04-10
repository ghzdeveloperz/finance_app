import 'package:flutter/material.dart';

class CashflowHighlight extends StatelessWidget {
  const CashflowHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _Item(
              label: 'Entradas',
              value: 'R\$ 0,00',
              color: Colors.green,
            ),
            _Item(
              label: 'Saídas',
              value: 'R\$ 0,00',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _Item({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}