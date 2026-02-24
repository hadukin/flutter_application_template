import 'package:injectable/injectable.dart';
import 'package:storage/src/db/db.dart';
import 'package:storage/src/db/database.dart';
import 'package:storage/src/db/tables/todo_table/i_todo_table.dart';

@Singleton(as: Database)
class DatabaseImpl implements Database {
  @override
  late final ITodoTable todos;

  DatabaseImpl({
    required Db db,
  }) : todos = db.todoDao;
}
