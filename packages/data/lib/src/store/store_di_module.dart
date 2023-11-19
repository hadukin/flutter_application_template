import 'package:data/src/store/user_store.dart';
import 'package:di/di.dart';

class StoreDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerSingleton<UserStore>(UserStore());
  }
}
