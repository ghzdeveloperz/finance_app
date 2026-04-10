import '../../domain/entities/transaction_entity.dart';
import '../dtos/transaction_dto.dart';

class TransactionMapper {
  const TransactionMapper._();

  static TransactionEntity toEntity(TransactionDto dto) {
    return TransactionEntity(
      id: dto.id,
      accountId: dto.accountId,
      categoryId: dto.categoryId,
      amount: dto.amount,
      description: dto.description,
      type: dto.type,
      transactionDate: dto.transactionDate,
      createdAt: dto.createdAt,
    );
  }
}
