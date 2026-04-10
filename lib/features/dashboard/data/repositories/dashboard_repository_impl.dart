import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../dtos/dashboard_summary_dto.dart';
import '../mappers/dashboard_summary_mapper.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  const DashboardRepositoryImpl(this.remote);

  @override
  Future<DashboardSummary> getSummary() async {
    final raw = await remote.fetchSummary();
    final dto = DashboardSummaryDto.fromMap(raw);
    return DashboardSummaryMapper.toEntity(dto);
  }
}
