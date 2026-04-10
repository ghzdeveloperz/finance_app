import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/datasources/accounts_remote_datasource.dart';
import '../data/repositories/accounts_repository_impl.dart';
import '../domain/usecases/create_account_usecase.dart';
import '../domain/usecases/get_accounts_usecase.dart';
import '../presentation/controllers/accounts_controller.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final accountsRemoteDataSourceProvider =
    Provider<AccountsRemoteDataSource>((ref) {
  return AccountsRemoteDataSource(ref.read(supabaseClientProvider));
});

final accountsRepositoryProvider = Provider((ref) {
  return AccountsRepositoryImpl(
    ref.read(accountsRemoteDataSourceProvider),
  );
});

final createAccountUseCaseProvider = Provider((ref) {
  return CreateAccountUseCase(ref.read(accountsRepositoryProvider));
});

final getAccountsUseCaseProvider = Provider((ref) {
  return GetAccountsUseCase(ref.read(accountsRepositoryProvider));
});

final accountsControllerProvider =
    StateNotifierProvider<AccountsController, List>((ref) {
  return AccountsController(
    createAccount: ref.read(createAccountUseCaseProvider),
    getAccounts: ref.read(getAccountsUseCaseProvider),
  );
});