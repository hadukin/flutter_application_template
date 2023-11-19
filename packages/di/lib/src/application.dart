import 'package:data/data.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';
import 'package:storage/storage.dart';

final class Application {
  static const Application _instance = Application._();

  const Application._();

  static Application get instance => _instance;

  Future<void> installDependencies({
    required String baseUrl,
    required bool isDebug,
  }) async {
    await Di.instance.installModule(const StorageDiModule());
    Di.instance.registerSingleton<TokensStore>(TokensStore());
    await Di.instance.installModule(NetworkDiModule(
      baseUrl: baseUrl,
      isDebug: isDebug,
    ));
    await Di.instance.installModule(const DataDiModule());
  }
}
