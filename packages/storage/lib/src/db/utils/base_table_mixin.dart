import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

mixin BaseTableMixin on Table {
  @override
  Set<Column>? get primaryKey => {localId};

  TextColumn get localId => text().clientDefault(() => const Uuid().v4())();

  DateTimeColumn get createAt => dateTime().clientDefault(DateTime.now)();

  DateTimeColumn get updateAt => dateTime().clientDefault(DateTime.now)();
}
