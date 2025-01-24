import 'package:domain/domain.dart';

final class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final AuthorizationRepository _repository;

  SignUpUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<UseCaseResult<UserEntity, Exception>> call(SignUpParams params) => innerCall(() {
        return _repository.signUp(
          email: params.email,
          password: params.password,
        );
      });
}
