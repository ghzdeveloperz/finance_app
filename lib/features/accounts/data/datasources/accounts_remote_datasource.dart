import 'package:supabase_flutter/supabase_flutter.dart';

class AccountsRemoteDataSource {
  final SupabaseClient client;

  const AccountsRemoteDataSource(this.client);

  Future<void> createAccount({required String name}) async {
    final user = client.auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    await client.from('accounts').insert({
      'user_id': user.id,
      'name': name,
      'balance': 0,
    });
  }

  Future<List<Map<String, dynamic>>> getAccounts() async {
    return await client.from('accounts').select();
  }
}