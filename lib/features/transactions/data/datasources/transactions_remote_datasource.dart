import 'package:supabase_flutter/supabase_flutter.dart';

class TransactionsRemoteDataSource {
  final SupabaseClient client;

  const TransactionsRemoteDataSource(this.client);

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    return client
        .from('transactions')
        .select('id, account_id, category_id, amount, description, type, transaction_date, created_at')
        .eq('user_id', user.id)
        .order('transaction_date', ascending: false);
  }

  Future<Map<String, dynamic>?> getTransactionDetails(String id) async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final response = await client
        .from('transactions')
        .select('id, account_id, category_id, amount, description, type, transaction_date, created_at')
        .eq('user_id', user.id)
        .eq('id', id)
        .maybeSingle();

    return response;
  }

  Future<void> createManualTransaction({
    required String accountId,
    String? categoryId,
    required double amount,
    required String description,
    required String type,
    required DateTime transactionDate,
  }) async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    await client.from('transactions').insert({
      'user_id': user.id,
      'account_id': accountId,
      'category_id': categoryId,
      'amount': amount,
      'description': description,
      'type': type,
      'transaction_date': transactionDate.toIso8601String().split('T').first,
    });
  }

  Future<void> updateTransactionCategory({
    required String transactionId,
    required String categoryId,
  }) async {
    final user = client.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    await client
        .from('transactions')
        .update({'category_id': categoryId})
        .eq('user_id', user.id)
        .eq('id', transactionId);
  }
}
