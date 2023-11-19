import 'package:core/store/store.dart';
import 'package:domain/src/authorization/entity/tokes_entity.dart';

final class TokensStore extends BaseNullableStore<Tokens> {
  @override
  Tokens? get initialValue => null;
}
