import 'package:supabase_flutter/supabase_flutter.dart';

class SessionGuard {
  const SessionGuard._();

  static bool isAuthenticated() {
    return Supabase.instance.client.auth.currentSession != null;
  }

  static String? currentUserId() {
    return Supabase.instance.client.auth.currentUser?.id;
  }
}