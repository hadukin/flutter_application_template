import 'package:domain/src/authorization/entity/tokes_entity.dart';
import 'package:domain/src/store/store.dart';

final class TokensStore extends BaseNullableStore<Tokens> {
  @override
  Tokens get initialValue => null;
}
