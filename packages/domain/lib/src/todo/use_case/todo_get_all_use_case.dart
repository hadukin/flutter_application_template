import 'package:domain/domain.dart';

class const TodoGetAllUseCase({required final TodoRepository _repository})
    implements UseCase<List<TodoEntity>, EmptyUseCaseParam> {
  @override
  Future<UseCaseResponse<List<TodoEntity>>> call(
    EmptyUseCaseParam param,
  ) async {
    try {
      final result = await _repository.getAll();
      return (data: result, err: null);
    } catch (e) {
      return (data: null, err: Exception('$e'));
    }
  }
}
