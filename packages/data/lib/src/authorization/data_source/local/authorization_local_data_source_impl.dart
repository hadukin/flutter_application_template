import 'package:storage/storage.dart';
import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';

final class AuthorizationLocalDataSourceImpl implements AuthorizationLocalDataSource {
  final TokenManager _tokenManager;

  AuthorizationLocalDataSourceImpl({
    required TokenManager tokenManager,
  }) : _tokenManager = tokenManager;

  @override
  Future<({String? access, String? refresh})?> getTokens() async {
    final pair = await _tokenManager.read();
    if (pair?.access == null || pair?.refresh == null) return null;
    return (access: pair?.access, refresh: pair?.refresh);
  }

  @override
  Future<void> write({required String? access, required String? refresh}) async {
    if (access == null || refresh == null) return;
    await _tokenManager.write(access: access, refresh: refresh);
  }

  @override
  Future<void> delete() async {
    await _tokenManager.delete();
  }
}
