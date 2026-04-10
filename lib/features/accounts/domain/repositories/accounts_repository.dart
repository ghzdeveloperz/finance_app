import '../entities/financial_account.dart';

abstract class AccountsRepository {
  Future<void> createAccount(String name);
  Future<List<FinancialAccount>> getAccounts();
}