import 'package:flutter/material.dart';

class RecentTransactionsPreview extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const RecentTransactionsPreview({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('Sem transações recentes'),
        ),
      );
    }

    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, i) {
          final t = items[i];
          return ListTile(
            title: Text(t['title']?.toString() ?? 'Transação'),
            subtitle: Text(t['amount']?.toString() ?? ''),
          );
        },
      ),
    );
  }
}
