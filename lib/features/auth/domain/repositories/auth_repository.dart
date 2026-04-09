import '../../../../core/errors/result.dart';
import '../entities/auth_user.dart';

abstract class AuthRepository {
  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
  });

  Future<Result<AuthUser>> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}