import 'package:drift/drift.dart';
import 'package:storage/src/db/tables/todo_table/i_todo_table.dart';
import 'package:storage/src/db/utils/base_table_mixin.dart';
import 'package:storage/src/db/db.dart';

part 'todo_table.g.dart';

@DataClassName('TodoDatabase')
class TodoTable extends Table with BaseTableMixin {
  TextColumn get title => text()();
}

@DriftAccessor(tables: [TodoTable])
class TodoDao extends DatabaseAccessor<Db> with _$TodoDaoMixin implements ITodoTable {
  TodoDao(super.db);

  @override
  Future<TodoDatabase> add({required String title}) async {
    try {
      return await into(todoTable).insertReturning(
        TodoTableCompanion(title: Value(title)),
        mode: InsertMode.insertOrReplace,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoDatabase>> getAll() async {
    return (select(todoTable)..orderBy([(t) => OrderingTerm(expression: t.updateAt, mode: OrderingMode.desc)])).get();
  }
}
