import 'package:domain/domain.dart';

final class UserStore extends BaseNullableStore<UserEntity> {
  @override
  UserEntity? get initialValue => null;
}
