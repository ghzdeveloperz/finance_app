import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/accounts_providers.dart';

class AccountsPage extends ConsumerWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (_, i) {
          final acc = accounts[i];
          return ListTile(
            title: Text(acc.name),
            subtitle: Text('R\$ ${acc.balance}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(accountsControllerProvider.notifier)
              .add('Nova Conta');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}