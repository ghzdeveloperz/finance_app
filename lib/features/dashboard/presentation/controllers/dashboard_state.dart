class DashboardState {
  final bool isLoading;
  final double totalBalance;
  final int accountsCount;
  final List<Map<String, dynamic>> recentTransactions;

  const DashboardState({
    this.isLoading = false,
    this.totalBalance = 0,
    this.accountsCount = 0,
    this.recentTransactions = const [],
  });

  DashboardState copyWith({
    bool? isLoading,
    double? totalBalance,
    int? accountsCount,
    List<Map<String, dynamic>>? recentTransactions,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      totalBalance: totalBalance ?? this.totalBalance,
      accountsCount: accountsCount ?? this.accountsCount,
      recentTransactions:
          recentTransactions ?? this.recentTransactions,
    );
  }
}
