sealed class Failure {
  final String message;

  const Failure(this.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unexpected error']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication error']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation error']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error']);
}