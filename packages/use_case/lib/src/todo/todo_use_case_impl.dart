import 'package:domain/domain.dart';

final class TodoUseCasesImpl implements TodoUseCases {
  final TodoRepository _todoRepository;

  const TodoUseCasesImpl({required TodoRepository todoRepository}) : _todoRepository = todoRepository;

  @override
  Future<TodoEntity> add(String title) async {
    return _todoRepository.add(title);
  }

  @override
  Future<List<TodoEntity>> getAll() {
    return _todoRepository.getAll();
  }
}
