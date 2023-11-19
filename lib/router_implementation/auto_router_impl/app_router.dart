import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/presentation/home/home_view.dart';
import 'package:flutter_application_template/presentation/launch/launch_view.dart';
import 'package:flutter_application_template/presentation/profile/profile_details_view.dart';
import 'package:flutter_application_template/presentation/profile/profile_view.dart';
import 'package:flutter_application_template/presentation/tabs_root/tabs_root_view.dart';
import 'package:flutter_application_template/presentation/todo/todo_view.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/auto_route_router.dart';

part 'app_router.gr.dart';

final class AutoRoutingSetupImpl implements IRoutingSetup {
  const AutoRoutingSetupImpl();

  @override
  IRouter create() => AutoRouterImpl(router: AppRouter());
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: LaunchRoute.page,
      path: '/launch',
      keepHistory: false,
      initial: true,
    ),
    AutoRoute(
      page: TabsRootRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: TabHomeRoute.page,
          path: 'home',
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: TabTodoRoute.page,
          path: 'todo',
          children: [
            AutoRoute(
              path: '',
              page: TodoRoute.page,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          page: TabProfileRoute.page,
          path: 'profile',
          children: [
            AutoRoute(
              initial: true,
              path: '',
              page: ProfileRoute.page,
            ),
            AutoRoute(
              path: 'details/:userId',
              page: ProfileDetailsRoute.page,
            ),
          ],
        ),
      ],
    ),
  ];
}

@RoutePage()
class TabHomeView extends AutoRouter {
  const TabHomeView({super.key});
}

@RoutePage()
class TabTodoView extends AutoRouter {
  const TabTodoView({super.key});
}

@RoutePage()
class TabProfileView extends AutoRouter {
  const TabProfileView({super.key});
}

@RoutePage()
class EmptyView extends AutoRouter {
  const EmptyView({super.key});
}
