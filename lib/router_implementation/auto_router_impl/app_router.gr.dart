// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LaunchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LaunchView(),
      );
    },
    ProfileDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ProfileDetailsRouteArgs>(
          orElse: () => ProfileDetailsRouteArgs(
                userId: pathParams.optString('userId'),
                userName: queryParams.optString('userName'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileDetailsView(
          key: args.key,
          userId: args.userId,
          userName: args.userName,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    TabHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabHomeView(),
      );
    },
    TabProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabProfileView(),
      );
    },
    TabSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabSettingsView(),
      );
    },
    TabsRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabsRootView(),
      );
    },
  };
}

/// generated route for
/// [EmptyView]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LaunchView]
class LaunchRoute extends PageRouteInfo<void> {
  const LaunchRoute({List<PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileDetailsView]
class ProfileDetailsRoute extends PageRouteInfo<ProfileDetailsRouteArgs> {
  ProfileDetailsRoute({
    Key? key,
    String? userId,
    String? userName,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileDetailsRoute.name,
          args: ProfileDetailsRouteArgs(
            key: key,
            userId: userId,
            userName: userName,
          ),
          rawPathParams: {'userId': userId},
          rawQueryParams: {'userName': userName},
          initialChildren: children,
        );

  static const String name = 'ProfileDetailsRoute';

  static const PageInfo<ProfileDetailsRouteArgs> page =
      PageInfo<ProfileDetailsRouteArgs>(name);
}

class ProfileDetailsRouteArgs {
  const ProfileDetailsRouteArgs({
    this.key,
    this.userId,
    this.userName,
  });

  final Key? key;

  final String? userId;

  final String? userName;

  @override
  String toString() {
    return 'ProfileDetailsRouteArgs{key: $key, userId: $userId, userName: $userName}';
  }
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabHomeView]
class TabHomeRoute extends PageRouteInfo<void> {
  const TabHomeRoute({List<PageRouteInfo>? children})
      : super(
          TabHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabProfileView]
class TabProfileRoute extends PageRouteInfo<void> {
  const TabProfileRoute({List<PageRouteInfo>? children})
      : super(
          TabProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabSettingsView]
class TabSettingsRoute extends PageRouteInfo<void> {
  const TabSettingsRoute({List<PageRouteInfo>? children})
      : super(
          TabSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabsRootView]
class TabsRootRoute extends PageRouteInfo<void> {
  const TabsRootRoute({List<PageRouteInfo>? children})
      : super(
          TabsRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabsRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
