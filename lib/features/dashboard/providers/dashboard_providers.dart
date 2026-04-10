import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/datasources/dashboard_remote_datasource.dart';
import '../data/repositories/dashboard_repository_impl.dart';
import '../domain/usecases/get_dashboard_summary_usecase.dart';
import '../presentation/controllers/dashboard_controller.dart';
import '../presentation/controllers/dashboard_state.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final dashboardRemoteDataSourceProvider =
    Provider<DashboardRemoteDataSource>((ref) {
  return DashboardRemoteDataSource(
    ref.read(supabaseClientProvider),
  );
});

final dashboardRepositoryProvider = Provider((ref) {
  return DashboardRepositoryImpl(
    ref.read(dashboardRemoteDataSourceProvider),
  );
});

final getDashboardSummaryUseCaseProvider = Provider((ref) {
  return GetDashboardSummaryUseCase(
    ref.read(dashboardRepositoryProvider),
  );
});

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  return DashboardController(
    getSummary: ref.read(getDashboardSummaryUseCaseProvider),
  );
});
