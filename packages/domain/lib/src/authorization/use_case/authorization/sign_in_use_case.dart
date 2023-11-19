import 'package:domain/domain.dart';

final class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  final AuthorizationRepository _repository;
  final TokensStore _tokensStore;

  SignInUseCase({
    required AuthorizationRepository repository,
    required TokensStore tokensStore,
  })  : _repository = repository,
        _tokensStore = tokensStore;

  @override
  Future<UseCaseResult<UserEntity, Exception>> call(SignInParams params) => innerCall(
        () async {
          final response = await _repository.signIn(
            email: params.email,
            password: params.password,
          );
          _tokensStore.setValue((
            access: response.credentials?.access,
            refresh: response.credentials?.refresh,
          ));
          return response;
        },
      );
}
