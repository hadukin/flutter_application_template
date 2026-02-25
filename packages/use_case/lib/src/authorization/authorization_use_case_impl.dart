import 'package:domain/domain.dart';

class AuthorizationUseCaseImpl implements AuthorizationUseCase {
  final AuthorizationRepository _repository;

  const AuthorizationUseCaseImpl({required AuthorizationRepository repository}) : _repository = repository;

  @override
  Future<TokensEntity?> getTokens() {
    return _repository.getTokens();
  }

  @override
  Future<UserEntity> signIn({required String email, required String password}) {
    return _repository.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() => _repository.signOut();
}
