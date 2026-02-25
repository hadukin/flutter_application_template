import 'package:rxdart/subjects.dart';

abstract class BaseStore<T extends Object> extends _BaseStore<T> {}

abstract class BaseNullableStore<T extends Object?> extends _BaseStore<T?> {
  @override
  void setValue(T? value) => _subject.add(value);
}

abstract interface class _BaseStore<T> {
  T get initialValue;

  late final _subject = BehaviorSubject<T>.seeded(initialValue);

  T get value => _subject.value;

  void setValue(T value) => _subject.add(value);

  Stream<T> get observe => _subject.stream.distinct();
}
