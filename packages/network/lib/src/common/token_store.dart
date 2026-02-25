import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

typedef Tokens = ({String? access, String? refresh})?;

@Singleton()
final class TokenStore {
  final _subject = BehaviorSubject<Tokens>()..asBroadcastStream();

  Stream<Tokens> get observe => _subject.stream.distinct();

  Tokens get value => _subject.valueOrNull;

  void setValue(Tokens value) {
    _subject.add(value);
  }
}
