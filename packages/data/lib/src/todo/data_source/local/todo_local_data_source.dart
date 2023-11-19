import 'package:domain/domain.dart';

abstract interface class TodoLocalDataSource {
  const TodoLocalDataSource();

  Future<TodoEntity> add(String title);

  Future<List<TodoEntity>> getAll();
}
