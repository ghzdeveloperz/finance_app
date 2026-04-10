import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/datasources/transactions_remote_datasource.dart';
import '../data/repositories/transactions_repository_impl.dart';
import '../domain/usecases/create_manual_transaction_usecase.dart';
import '../domain/usecases/get_transactions_usecase.dart';
import '../presentation/controllers/transactions_controller.dart';
import '../presentation/controllers/transactions_state.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final transactionsRemoteDataSourceProvider =
    Provider<TransactionsRemoteDataSource>((ref) {
  return TransactionsRemoteDataSource(
    ref.read(supabaseClientProvider),
  );
});

final transactionsRepositoryProvider = Provider((ref) {
  return TransactionsRepositoryImpl(
    ref.read(transactionsRemoteDataSourceProvider),
  );
});

final getTransactionsUseCaseProvider = Provider((ref) {
  return GetTransactionsUseCase(
    ref.read(transactionsRepositoryProvider),
  );
});

final createManualTransactionUseCaseProvider = Provider((ref) {
  return CreateManualTransactionUseCase(
    ref.read(transactionsRepositoryProvider),
  );
});

final transactionsControllerProvider =
    StateNotifierProvider<TransactionsController, TransactionsState>((ref) {
  return TransactionsController(
    getTransactions: ref.read(getTransactionsUseCaseProvider),
    createManualTransaction: ref.read(createManualTransactionUseCaseProvider),
  );
});
