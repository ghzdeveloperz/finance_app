import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dashboard_providers.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_summary_section.dart';
import '../widgets/cashflow_highlight.dart';
import '../widgets/recent_transactions_preview.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(dashboardControllerProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(dashboardControllerProvider.notifier).load(),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  DashboardHeader(total: state.totalBalance),
                  const SizedBox(height: 16),
                  DashboardSummarySection(
                    total: state.totalBalance,
                    accountsCount: state.accountsCount,
                  ),
                  const SizedBox(height: 16),
                  const CashflowHighlight(),
                  const SizedBox(height: 16),
                  RecentTransactionsPreview(
                    items: state.recentTransactions,
                  ),
                ],
              ),
            ),
    );
  }
}
