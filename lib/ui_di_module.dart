import 'package:app_links/app_links.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/router/go_router_impl/go_router.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service_impl.dart';
import 'package:go_router/go_router.dart';

// if use GoRouter
typedef Graph = IRouter<GoRouter, RouterDetails>;

// if use AutoRoute
// typedef Graph = IRouter<AppRouter, RouterDetails>;

class UiDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    final app = AppLinks();

    final initialLink = await app.getInitialLink();

    // final router = const AutoRoutingSetupImpl().build();
    final router = const GoRoutingSetupImpl().build();

    instance.registerSingleton<Graph>(router);
    instance.registerLazySingleton<SnackBarService>(SnackBarServiceImpl());
  }
}
