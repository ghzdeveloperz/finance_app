import 'package:flutter/material.dart';

class DashboardSummarySection extends StatelessWidget {
  final double total;
  final int accountsCount;

  const DashboardSummarySection({
    super.key,
    required this.total,
    required this.accountsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: R\$ ${total.toStringAsFixed(2)}'),
            Text('Contas: $accountsCount'),
          ],
        ),
      ),
    );
  }
}
