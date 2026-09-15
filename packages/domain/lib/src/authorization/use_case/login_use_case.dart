import 'package:domain/domain.dart';

class const LoginUseCaseParam(final String email, final String passowrd) implements UseCaseParam {}

class LoginUseCase({required final AuthorizationRepository _repository})
    implements UseCase<UserEntity, LoginUseCaseParam> {
  @override
  Future<UseCaseResponse<UserEntity>> call(LoginUseCaseParam param) async {
    try {
      final user = await _repository.signIn(email: param.email, password: param.passowrd);
      return (data: user, err: null);
    } catch (e) {
      return (data: null, err: Exception('$e'));
    }
  }
}
