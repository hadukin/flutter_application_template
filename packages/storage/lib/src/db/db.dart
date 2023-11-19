import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:storage/src/db/tables/users.dart';
import 'package:uuid/uuid.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [UsersTable],
  daos: [UsersDao],
)
final class Db extends _$Db {
  Db() : super(_openConnection());

  Db.connect(DatabaseConnection super.connection);

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

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'template');
  }
}
