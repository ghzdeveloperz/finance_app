import '../../../../core/errors/failure_mapper.dart';
import '../../../../core/errors/result.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../dtos/auth_user_dto.dart';
import '../mappers/auth_user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  const AuthRepositoryImpl(this.remote);

  @override
  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remote.signIn(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null || user.email == null) {
        return const FailureResult<AuthUser>('Usuário inválido');
      }

      final dto = AuthUserDto(
        id: user.id,
        email: user.email!,
      );

      return Success(AuthUserMapper.toEntity(dto));
    } catch (error) {
      return FailureResult(FailureMapper.fromException(error));
    }
  }

  @override
  Future<Result<AuthUser>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remote.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null || user.email == null) {
        return const FailureResult<AuthUser>('Falha ao criar conta');
      }

      final dto = AuthUserDto(
        id: user.id,
        email: user.email!,
      );

      return Success(AuthUserMapper.toEntity(dto));
    } catch (error) {
      return FailureResult(FailureMapper.fromException(error));
    }
  }

  @override
  Future<void> signOut() {
    return remote.signOut();
  }
}