import 'package:supabase_flutter/supabase_flutter.dart';

import 'route_names.dart';

class RouteGuards {
  const RouteGuards._();

  static String? authGuard() {
    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      return RouteNames.signIn;
    }
    return null;
  }

  static String? guestGuard() {
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      return RouteNames.dashboard;
    }
    return null;
  }
}