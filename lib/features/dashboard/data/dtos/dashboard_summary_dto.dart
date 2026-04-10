class DashboardSummaryDto {
  final double totalBalance;
  final int accountsCount;
  final List<Map<String, dynamic>> recentTransactions;

  const DashboardSummaryDto({
    required this.totalBalance,
    required this.accountsCount,
    required this.recentTransactions,
  });

  factory DashboardSummaryDto.fromMap(Map<String, dynamic> map) {
    return DashboardSummaryDto(
      totalBalance: (map['total_balance'] as num?)?.toDouble() ?? 0.0,
      accountsCount: (map['accounts_count'] as num?)?.toInt() ?? 0,
      recentTransactions: (map['recent_transactions'] as List?)
              ?.cast<Map<String, dynamic>>() ??
          const [],
    );
  }
}
