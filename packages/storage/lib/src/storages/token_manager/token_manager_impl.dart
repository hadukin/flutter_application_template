import 'package:rxdart/rxdart.dart';
import 'package:storage/src/storages/token_manager/token_manager.dart';
import 'package:storage/src/storages/token_storage/token_storage.dart';

class TokenManagerImpl implements TokenManager {
  final TokenStorage _storage;

  TokenManagerImpl({
    required TokenStorage storage,
  }) : _storage = storage;

  final _subject = BehaviorSubject<({String? access, String? refresh})?>.seeded(null)..asBroadcastStream();

  @override
  ({String? access, String? refresh})? get tokens => _subject.value;

  @override
  ValueStream<({String? access, String? refresh})?> get stream => _subject.stream..distinct();

  @override
  Future<void> init() async {
    final pair = await _storage.read();
    _subject.add((access: pair?.access, refresh: pair?.refresh));
  }

  @override
  Future<void> write({required String? access, required String? refresh}) async {
    await _storage.write(access: access, refresh: refresh);
    _subject.add((access: access, refresh: refresh));
  }

  @override
  Future<void> delete() async {
    await _storage.delete();
    _subject.add(null);
  }

  @override
  Future<({String? access, String? refresh})?> read() {
    return _storage.read();
  }
}
