import 'package:storage/src/db/tables/todo_table/i_todo_table.dart';

abstract interface class Database {
  late final ITodoTable todos;
}
