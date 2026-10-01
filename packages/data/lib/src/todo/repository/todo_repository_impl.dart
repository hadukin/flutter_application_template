import 'package:data/src/todo/data_source/local/todo_local_data_source.dart';
import 'package:domain/domain.dart';

class const TodoRepositoryImpl({
  required final TodoLocalDataSource _todoLocalDataSource,
}) implements TodoRepository {
  @override
  Future<TodoEntity> add(String title) async {
    return _todoLocalDataSource.add(title);
  }

  @override
  Future<List<TodoEntity>> getAll() {
    return _todoLocalDataSource.getAll();
  }
}
