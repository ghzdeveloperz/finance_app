import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardRemoteDataSource {
  final SupabaseClient client;

  const DashboardRemoteDataSource(this.client);

  /// Fetches raw data needed for dashboard summary.
  /// For now, we only aggregate accounts (simple, safe for UI).
  Future<Map<String, dynamic>> fetchSummary() async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final accounts = await client
        .from('accounts')
        .select('id, name, balance')
        .eq('user_id', user.id);

    double total = 0;
    for (final a in accounts) {
      final b = (a['balance'] as num?)?.toDouble() ?? 0.0;
      total += b;
    }

    return {
      'total_balance': total,
      'accounts_count': accounts.length,
      'recent_transactions': <Map<String, dynamic>>[], // placeholder
    };
  }
}
