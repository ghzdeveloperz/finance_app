import 'package:supabase_flutter/supabase_flutter.dart';

class ObserveAuthStateUseCase {
  const ObserveAuthStateUseCase();

  Stream<AuthState> call() {
    return Supabase.instance.client.auth.onAuthStateChange;
  }
}