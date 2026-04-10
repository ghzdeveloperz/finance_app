import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/transactions_providers.dart';
import '../widgets/transaction_list.dart';
import '../widgets/transaction_filter_bar.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(transactionsControllerProvider.notifier).load(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Transações')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const TransactionFilterBar(),
                Expanded(
                  child: TransactionList(items: state.items),
                ),
              ],
            ),
    );
  }
}
