import 'package:domain/domain.dart';

abstract interface class TodoUseCases {
  const TodoUseCases();

  Future<TodoEntity> add(String title);

  Future<List<TodoEntity>> getAll();
}
