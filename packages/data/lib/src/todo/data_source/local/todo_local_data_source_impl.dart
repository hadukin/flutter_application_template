import 'package:data/src/todo/data_source/local/todo_local_data_source.dart';
import 'package:domain/src/todo/entity/todo_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/storage.dart';

@Singleton(as: TodoLocalDataSource)
final class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Database _db;

  TodoLocalDataSourceImpl({
    required Database db,
  }) : _db = db;

  @override
  Future<TodoEntity> add(String title) async {
    final todo = await _db.todos.add(title: title);

    return TodoEntity(id: todo.localId, title: todo.title);
  }

  @override
  Future<List<TodoEntity>> getAll() async {
    final response = await _db.todos.getAll();

    return response.map((todo) => TodoEntity(id: todo.localId, title: todo.title)).toList();
  }
}
