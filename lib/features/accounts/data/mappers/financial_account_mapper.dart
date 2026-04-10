import '../../domain/entities/financial_account.dart';
import '../dtos/financial_account_dto.dart';

class FinancialAccountMapper {
  static FinancialAccount toEntity(FinancialAccountDto dto) {
    return FinancialAccount(
      id: dto.id,
      name: dto.name,
      balance: dto.balance,
    );
  }
}