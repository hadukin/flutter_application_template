import 'package:domain/domain.dart';

class const TestUseCase({required final AuthorizationRepository _repository})
    implements UseCase<void, EmptyUseCaseParam> {
  @override
  Future<UseCaseResponse<void>> call(EmptyUseCaseParam param) async {
    try {
      await _repository.createTest();
      return (data: null, err: null);
    } catch (e) {
      return (data: null, err: Exception('$e'));
    }
  }
}
