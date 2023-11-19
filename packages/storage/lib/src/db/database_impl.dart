import 'package:storage/src/db/db.dart';
import 'package:storage/src/db/database.dart';
import 'package:storage/src/db/tables/i_users.dart';

class DatabaseImpl implements Database {
  @override
  late final IUsersTable users;

  DatabaseImpl({
    required Db db,
  }) : users = db.usersDao;
}
