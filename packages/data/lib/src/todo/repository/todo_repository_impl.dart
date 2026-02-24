import 'package:data/src/todo/data_source/local/todo_local_data_source.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TodoRepository)
final class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource _todoLocalDataSource;

  const TodoRepositoryImpl({
    required TodoLocalDataSource todoLocalDataSource,
  }) : _todoLocalDataSource = todoLocalDataSource;

  @override
  Future<TodoEntity> add(String title) async {
    return _todoLocalDataSource.add(title);
  }

  @override
  Future<List<TodoEntity>> getAll() {
    return _todoLocalDataSource.getAll();
  }
}
