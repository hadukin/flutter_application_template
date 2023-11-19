import 'package:auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signUp({required String email, required String password}) async {
    print('SIGN UP CALL');
  }
}
