import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/transactions_providers.dart';

class CreateTransactionPage extends ConsumerStatefulWidget {
  const CreateTransactionPage({super.key});

  @override
  ConsumerState<CreateTransactionPage> createState() =>
      _CreateTransactionPageState();
}

class _CreateTransactionPageState extends ConsumerState<CreateTransactionPage> {
  final _accountIdController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();

  String _type = 'expense';

  @override
  void dispose() {
    _accountIdController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null) {
      return;
    }

    await ref.read(transactionsControllerProvider.notifier).create(
          accountId: _accountIdController.text.trim(),
          amount: amount,
          description: _descriptionController.text.trim(),
          type: _type,
          transactionDate: DateTime.now(),
        );

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova transação')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _accountIdController,
              decoration: const InputDecoration(labelText: 'Account ID'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _type,
              items: const [
                DropdownMenuItem(value: 'income', child: Text('Entrada')),
                DropdownMenuItem(value: 'expense', child: Text('Saída')),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() => _type = value);
              },
              decoration: const InputDecoration(labelText: 'Tipo'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
