import 'package:data/src/db/db.dart';
import 'package:data/src/db/i_database.dart';
import 'package:data/src/db/tables/i_users.dart';

class Database implements IDatabase {
  @override
  late final IUsersTable users;

  Database({
    required Db db,
  }) : users = db.usersDao;
}
