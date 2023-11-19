import 'package:storage/src/db/db.dart';

abstract interface class IUsersTable {
  Future<void> add({
    required String email,
    required String? accessToken,
    required String? refreshToken,
  });

  Future<List<UserDatabase>> getAll();

  Future<UserDatabase> getUserById(String email);
}
