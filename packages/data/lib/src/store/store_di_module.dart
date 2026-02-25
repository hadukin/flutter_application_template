import 'package:data/src/store/user_store_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';

class StoreDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerLazySingleton<UserStore>(UserStoreImpl());
  }
}
