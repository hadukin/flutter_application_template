import 'package:domain/src/todo/entity/todo_entity.dart';

abstract interface class TodoRepository {
  const TodoRepository();

  Future<TodoEntity> add(String title);

  Future<List<TodoEntity>> getAll();
}
