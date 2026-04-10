class DashboardSummary {
  final double totalBalance;
  final int accountsCount;
  final List<Map<String, dynamic>> recentTransactions;

  const DashboardSummary({
    required this.totalBalance,
    required this.accountsCount,
    required this.recentTransactions,
  });
}
