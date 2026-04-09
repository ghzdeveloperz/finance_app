import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;

  const AuthRemoteDataSource(this.client);

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) {
    return client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) {
    return client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return client.auth.signOut();
  }
}