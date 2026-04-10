import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../datasources/transactions_remote_datasource.dart';
import '../dtos/transaction_dto.dart';
import '../mappers/transaction_mapper.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRemoteDataSource remote;

  const TransactionsRepositoryImpl(this.remote);

  @override
  Future<void> createManualTransaction({
    required String accountId,
    String? categoryId,
    required double amount,
    required String description,
    required String type,
    required DateTime transactionDate,
  }) {
    return remote.createManualTransaction(
      accountId: accountId,
      categoryId: categoryId,
      amount: amount,
      description: description,
      type: type,
      transactionDate: transactionDate,
    );
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final data = await remote.getTransactions();

    return data
        .map((e) => TransactionMapper.toEntity(TransactionDto.fromMap(e)))
        .toList();
  }

  @override
  Future<TransactionEntity?> getTransactionDetails(String id) async {
    final raw = await remote.getTransactionDetails(id);
    if (raw == null) {
      return null;
    }

    return TransactionMapper.toEntity(TransactionDto.fromMap(raw));
  }

  @override
  Future<void> updateTransactionCategory({
    required String transactionId,
    required String categoryId,
  }) {
    return remote.updateTransactionCategory(
      transactionId: transactionId,
      categoryId: categoryId,
    );
  }
}
