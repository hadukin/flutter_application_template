import 'package:domain/domain.dart';

class const TodoAddUseCaseParam(final String title) implements UseCaseParam;

class const TodoAddUseCase({required final TodoRepository _repository})
    implements UseCase<TodoEntity, TodoAddUseCaseParam> {
  @override
  Future<UseCaseResponse<TodoEntity>> call(TodoAddUseCaseParam param) async {
    try {
      final result = await _repository.add(param.title);
      return (data: result, err: null);
    } catch (e) {
      return (data: null, err: Exception('$e'));
    }
  }
}
