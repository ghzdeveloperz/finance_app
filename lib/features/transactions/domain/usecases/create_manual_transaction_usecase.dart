import '../repositories/transactions_repository.dart';

class CreateManualTransactionUseCase {
  final TransactionsRepository repository;

  const CreateManualTransactionUseCase(this.repository);

  Future<void> call({
    required String accountId,
    String? categoryId,
    required double amount,
    required String description,
    required String type,
    required DateTime transactionDate,
  }) {
    return repository.createManualTransaction(
      accountId: accountId,
      categoryId: categoryId,
      amount: amount,
      description: description,
      type: type,
      transactionDate: transactionDate,
    );
  }
}
