import '../entities/financial_account.dart';
import '../repositories/accounts_repository.dart';

class GetAccountsUseCase {
  final AccountsRepository repository;

  const GetAccountsUseCase(this.repository);

  Future<List<FinancialAccount>> call() {
    return repository.getAccounts();
  }
}