import 'package:data/src/db/db.dart';
import 'package:domain/domain.dart';

abstract interface class IUsersTable {
  Future<void> add(UserEntity user);

  Future<List<UserDatabase>> getAll();

  Future<UserDatabase> getUserById(String email);
}
