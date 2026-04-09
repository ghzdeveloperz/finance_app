import '../../../../core/errors/result.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  const SignUpUseCase(this.repository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
  }) {
    return repository.signUp(email: email, password: password);
  }
}