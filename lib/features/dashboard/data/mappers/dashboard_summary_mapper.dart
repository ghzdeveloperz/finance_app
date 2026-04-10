import '../../domain/entities/dashboard_summary.dart';
import '../dtos/dashboard_summary_dto.dart';

class DashboardSummaryMapper {
  static DashboardSummary toEntity(DashboardSummaryDto dto) {
    return DashboardSummary(
      totalBalance: dto.totalBalance,
      accountsCount: dto.accountsCount,
      recentTransactions: dto.recentTransactions,
    );
  }
}
