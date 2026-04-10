import '../../domain/entities/financial_account.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/accounts_remote_datasource.dart';
import '../dtos/financial_account_dto.dart';
import '../mappers/financial_account_mapper.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsRemoteDataSource remote;

  const AccountsRepositoryImpl(this.remote);

  @override
  Future<void> createAccount(String name) {
    return remote.createAccount(name: name);
  }

  @override
  Future<List<FinancialAccount>> getAccounts() async {
    final data = await remote.getAccounts();
    return data.map((e) => FinancialAccountMapper.toEntity(
      FinancialAccountDto.fromMap(e),
    )).toList();
  }
}