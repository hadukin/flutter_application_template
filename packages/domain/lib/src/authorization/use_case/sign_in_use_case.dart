import 'package:domain/domain.dart';

final class SignInUseCase extends UseCase<UserEntity, SignInParams> {
  final AuthorizationRepository _repository;

  SignInUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<UseCaseResult<UserEntity, Exception>> call(SignInParams params) => innerCall(
        () => _repository.signIn(
          email: params.email,
          password: params.password,
        ),
      );
}
