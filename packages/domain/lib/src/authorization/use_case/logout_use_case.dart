import 'package:domain/domain.dart';

// class const LoUseCaseParam(final String email, final String passowrd) implements UseCaseParam {}

class LogoutUseCase({required final AuthorizationRepository _repository}) implements UseCase<void, EmptyUseCaseParam> {
  @override
  Future<UseCaseResponse<void>> call(EmptyUseCaseParam param) async {
    try {
      await _repository.signOut();
      return (data: null, err: null);
    } catch (e) {
      return (data: null, err: Exception('$e'));
    }
  }
}
