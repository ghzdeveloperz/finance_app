import '../repositories/transactions_repository.dart';

class UpdateTransactionCategoryUseCase {
  final TransactionsRepository repository;

  const UpdateTransactionCategoryUseCase(this.repository);

  Future<void> call({
    required String transactionId,
    required String categoryId,
  }) {
    return repository.updateTransactionCategory(
      transactionId: transactionId,
      categoryId: categoryId,
    );
  }
}
