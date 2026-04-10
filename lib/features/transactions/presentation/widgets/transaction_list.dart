import 'package:flutter/material.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transaction_row_item.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionEntity> items;

  const TransactionList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('Sem transações'),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        return TransactionRowItem(item: item);
      },
    );
  }
}
