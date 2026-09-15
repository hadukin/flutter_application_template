import 'package:domain/domain.dart';

abstract interface class AuthorizationLocalDataSource {
  Future<({String? access, String? refresh})?> getTokens();

  Future<void> write({required String? access, required String? refresh});

  Future<void> delete();
}
