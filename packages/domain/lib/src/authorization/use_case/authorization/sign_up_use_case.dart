import 'package:domain/domain.dart';

final class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final AuthorizationRepository _repository;
  final TokensStore _tokensStore;

  SignUpUseCase({
    required AuthorizationRepository repository,
    required TokensStore tokensStore,
  })  : _repository = repository,
        _tokensStore = tokensStore;

  @override
  Future<UseCaseResult<UserEntity, Exception>> call(SignUpParams params) => innerCall(() async {
        try {
          final response = await _repository.signUp(
            email: params.email,
            password: params.password,
          );
          _tokensStore.setValue((
            access: response.credentials?.access,
            refresh: response.credentials?.refresh,
          ));

          return response;
        } catch (e) {
          rethrow;
        }
      });
}
