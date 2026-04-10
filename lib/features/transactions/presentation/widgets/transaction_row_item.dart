import 'package:flutter/material.dart';

import '../../domain/entities/transaction_entity.dart';

class TransactionRowItem extends StatelessWidget {
  final TransactionEntity item;

  const TransactionRowItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final color = item.isIncome ? Colors.green : Colors.red;

    return ListTile(
      title: Text(item.description.isEmpty ? 'Sem descrição' : item.description),
      subtitle: Text(item.transactionDate.toIso8601String().split('T').first),
      trailing: Text(
        'R\$ ${item.amount.toStringAsFixed(2)}',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
