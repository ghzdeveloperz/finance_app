import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/create_manual_transaction_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import 'transactions_state.dart';

class TransactionsController extends StateNotifier<TransactionsState> {
  final GetTransactionsUseCase getTransactions;
  final CreateManualTransactionUseCase createManualTransaction;

  TransactionsController({
    required this.getTransactions,
    required this.createManualTransaction,
  }) : super(const TransactionsState());

  Future<void> load() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);
      final items = await getTransactions();
      state = state.copyWith(
        isLoading: false,
        items: items,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> create({
    required String accountId,
    String? categoryId,
    required double amount,
    required String description,
    required String type,
    required DateTime transactionDate,
  }) async {
    await createManualTransaction(
      accountId: accountId,
      categoryId: categoryId,
      amount: amount,
      description: description,
      type: type,
      transactionDate: transactionDate,
    );
    await load();
  }
}
