import 'package:core/core.dart';
import 'package:auth/auth.dart';

final class App extends Application {
  static final App _instance = App._();

  App._();

  static App get instance => _instance;

  @override
  Future<void> init() async {
    await di.installModule(AuthDiModule());
  }
}
