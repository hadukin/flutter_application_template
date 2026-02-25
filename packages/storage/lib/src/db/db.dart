import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/src/db/tables/todo_table/todo_table.dart';
import 'package:uuid/uuid.dart';

part 'db.g.dart';

@Injectable()
@DriftDatabase(
  tables: [TodoTable],
  daos: [TodoDao],
)
final class Db extends _$Db {
  Db(super.e);

  @factoryMethod
  Db.defaults() : super(driftDatabase(name: 'app_db'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }
}
