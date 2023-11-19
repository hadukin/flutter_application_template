import 'package:app_links/app_links.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/app_router.dart';
import 'package:flutter_application_template/router_implementation/go_router_impl/go_router.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service_impl.dart';

class UiDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    final app = AppLinks();

    final initialLink = await app.getInitialLink();

    // final router = const AutoRoutingSetupImpl().create();
    final router = const GoRoutingSetupImpl().create();

    instance.registerSingleton<IRouter>(router);
    instance.registerLazySingleton<SnackBarService>(SnackBarServiceImpl());
  }
}
