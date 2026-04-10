import '../entities/transaction_entity.dart';
import '../repositories/transactions_repository.dart';

class GetTransactionDetailsUseCase {
  final TransactionsRepository repository;

  const GetTransactionDetailsUseCase(this.repository);

  Future<TransactionEntity?> call(String id) {
    return repository.getTransactionDetails(id);
  }
}
