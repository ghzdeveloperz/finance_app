import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/financial_account.dart';
import '../../domain/usecases/create_account_usecase.dart';
import '../../domain/usecases/get_accounts_usecase.dart';

class AccountsController extends StateNotifier<List<FinancialAccount>> {
  final CreateAccountUseCase createAccount;
  final GetAccountsUseCase getAccounts;

  AccountsController({
    required this.createAccount,
    required this.getAccounts,
  }) : super([]);

  Future<void> load() async {
    state = await getAccounts();
  }

  Future<void> add(String name) async {
    await createAccount(name);
    await load();
  }
}