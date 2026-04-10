import '../repositories/accounts_repository.dart';

class CreateAccountUseCase {
  final AccountsRepository repository;

  const CreateAccountUseCase(this.repository);

  Future<void> call(String name) {
    return repository.createAccount(name);
  }
}