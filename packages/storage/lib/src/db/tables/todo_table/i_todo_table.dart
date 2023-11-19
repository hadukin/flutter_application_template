import 'package:storage/src/db/db.dart';

abstract interface class ITodoTable {
  Future<TodoDatabase> add({required String title});
  Future<List<TodoDatabase>> getAll();
}
