import 'package:supabase_flutter/supabase_flutter.dart';

import 'failure.dart';

class FailureMapper {
  const FailureMapper._();

  static Failure fromException(Object error) {
    if (error is AuthException) {
      return AuthFailure(error.message);
    }

    if (error is PostgrestException) {
      return ValidationFailure(error.message);
    }

    return const UnknownFailure();
  }
}