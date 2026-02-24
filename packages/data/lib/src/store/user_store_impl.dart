import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserStore)
final class UserStoreImpl extends UserStore {
  @override
  UserEntity? get initialValue => null;
}
