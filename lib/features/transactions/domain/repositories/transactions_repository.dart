import '../entities/transaction_entity.dart';

abstract class TransactionsRepository {
  Future<List<TransactionEntity>> getTransactions();

  Future<TransactionEntity?> getTransactionDetails(String id);

  Future<void> createManualTransaction({
    required String accountId,
    String? categoryId,
    required double amount,
    required String description,
    required String type,
    required DateTime transactionDate,
  });

  Future<void> updateTransactionCategory({
    required String transactionId,
    required String categoryId,
  });
}
