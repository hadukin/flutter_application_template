import 'package:drift/drift.dart';
import 'package:storage/src/db/utils/base_table_mixin.dart';
import 'package:storage/src/db/db.dart';
import 'package:storage/src/db/tables/i_users.dart';

part 'users.g.dart';

@DataClassName('UserDatabase')
class UsersTable extends Table with BaseTableMixin {
  TextColumn get email => text().unique()();

  TextColumn get accessToken => text()();

  TextColumn get refreshToken => text()();
}

@DriftAccessor(tables: [UsersTable])
class UsersDao extends DatabaseAccessor<Db> with _$UsersDaoMixin implements IUsersTable {
  UsersDao(super.db);

  @override
  Future<void> add({
    required String email,
    required String? accessToken,
    required String? refreshToken,
  }) async {
    try {
      await transaction(() async {
        await into(usersTable).insert(
          UsersTableCompanion(
            email: Value(email),
            accessToken: Value.absentIfNull(accessToken),
            refreshToken: Value.absentIfNull(refreshToken),
            updateAt: Value(DateTime.now()),
          ),
          mode: InsertMode.insertOrReplace,
        );
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserDatabase>> getAll() async {
    return (select(usersTable)..orderBy([(t) => OrderingTerm(expression: t.updateAt, mode: OrderingMode.desc)])).get();
  }

  @override
  Future<UserDatabase> getUserById(String email) async {
    final result = await (select(usersTable)..where((t) => t.email.equals(email))).get();
    return result.first;
  }
}
