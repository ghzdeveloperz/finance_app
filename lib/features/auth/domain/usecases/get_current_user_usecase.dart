import 'package:supabase_flutter/supabase_flutter.dart';

class GetCurrentUserUseCase {
  const GetCurrentUserUseCase();

  User? call() {
    return Supabase.instance.client.auth.currentUser;
  }
}