import 'package:app_links/app_links.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/router_implementation/go_router_impl/go_router.dart';
import 'package:flutter_application_template/router_implementation/go_router_impl/go_router_impl.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service_impl.dart';

class UiDiModule implements BaseDIModule {
  @override
  Future<void> updateInjections(Di instance) async {
    final app = AppLinks();

    final initialLink = await app.getInitialLink();

    // instance.registerSingleton<IRouter>(AutoRouterImpl(
    //   router: AppRouter(),
    //   initialDeepLink: '/launch',
    // ));

    instance.registerSingleton<BaseRouter>(GoRouterImpl(
      router: gorouter,
      initialDeepLink: '/launch',
    ));

    instance.registerLazySingleton<SnackBarService>(SnackBarServiceImpl());
  }
}
