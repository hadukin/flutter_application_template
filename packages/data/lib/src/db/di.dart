import 'package:data/src/db/database.dart';
import 'package:data/src/db/db.dart';
import 'package:data/src/db/i_database.dart';
import 'package:di/di.dart';

class DatabaseDiModule implements BaseDIModule {
  @override
  Future<void> updateInjections(Di instance) async {
    instance.registerSingleton<IDatabase>(Database(db: Db()));
  }
}
