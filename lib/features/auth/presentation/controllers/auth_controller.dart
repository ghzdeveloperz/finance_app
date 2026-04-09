import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/result.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthController({
    required this.signInUseCase,
    required this.signUpUseCase,
  }) : super(const AuthState());

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await signInUseCase(
      email: email,
      password: password,
    );

    state = state.copyWith(isLoading: false);

    return switch (result) {
      Success() => true,
      FailureResult(:final failure) => _handleFailure(failure),
    };
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await signUpUseCase(
      email: email,
      password: password,
    );

    state = state.copyWith(isLoading: false);

    return switch (result) {
      Success() => true,
      FailureResult(:final failure) => _handleFailure(failure),
    };
  }

  bool _handleFailure(Object failure) {
    if (failure is Failure) {
      state = state.copyWith(errorMessage: failure.message);
      return false;
    }

    state = state.copyWith(errorMessage: failure.toString());
    return false;
  }
}