import '../../domain/entities/auth_user.dart';
import '../dtos/auth_user_dto.dart';

class AuthUserMapper {
  const AuthUserMapper._();

  static AuthUser toEntity(AuthUserDto dto) {
    return AuthUser(
      id: dto.id,
      email: dto.email,
    );
  }
}