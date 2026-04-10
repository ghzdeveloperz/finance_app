import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_dashboard_summary_usecase.dart';
import 'dashboard_state.dart';

class DashboardController extends StateNotifier<DashboardState> {
  final GetDashboardSummaryUseCase getSummary;

  DashboardController({
    required this.getSummary,
  }) : super(const DashboardState());

  Future<void> load() async {
    try {
      state = state.copyWith(isLoading: true);

      final summary = await getSummary();

      state = state.copyWith(
        isLoading: false,
        totalBalance: summary.totalBalance,
        accountsCount: summary.accountsCount,
        recentTransactions: summary.recentTransactions,
      );
    } catch (e) {
      print('🔥 DASHBOARD ERROR: $e');

      state = state.copyWith(isLoading: false);
    }
  }
}
