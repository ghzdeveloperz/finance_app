import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSessionManager {
  final SupabaseClient _client;

  const AuthSessionManager(this._client);

  Session? get currentSession => _client.auth.currentSession;
  User? get currentUser => _client.auth.currentUser;

  Stream<AuthState> authStateChanges() {
    return _client.auth.onAuthStateChange;
  }
}