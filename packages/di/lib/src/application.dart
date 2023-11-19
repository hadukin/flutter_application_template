import 'package:data/data.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:network/di/network_di_module.dart';

final class Application {
  static final Application _instance = Application._();

  Application._();

  static Application get instance => _instance;

  Future<void> installDependencies({
    required String baseUrl,
    required bool isDebug,
  }) async {
    Di.instance.registerSingleton<TokensStore>(TokensStore());

    await Di.instance.installModule(NetworkDiModule(
      baseUrl: baseUrl,
      isDebug: isDebug,
    ));
    await Di.instance.installModule(const DataDiModule());
  }
}
