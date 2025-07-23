// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [EmptyView]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
    : super(EmptyRoute.name, initialChildren: children);

  static const String name = 'EmptyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LaunchView]
class LaunchRoute extends PageRouteInfo<void> {
  const LaunchRoute({List<PageRouteInfo>? children})
    : super(LaunchRoute.name, initialChildren: children);

  static const String name = 'LaunchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LaunchView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<ProfileDetailsRouteArgs>(
        orElse:
            () => ProfileDetailsRouteArgs(
              userId: pathParams.optString('userId'),
              userName: queryParams.optString('userName'),
            ),
      );
      return ProfileDetailsView(
        key: args.key,
        userId: args.userId,
        userName: args.userName,
      );
    },
  );
}

class ProfileDetailsRouteArgs {
  const ProfileDetailsRouteArgs({this.key, this.userId, this.userName});

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
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [TabHomeView]
class TabHomeRoute extends PageRouteInfo<void> {
  const TabHomeRoute({List<PageRouteInfo>? children})
    : super(TabHomeRoute.name, initialChildren: children);

  static const String name = 'TabHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabHomeView();
    },
  );
}

/// generated route for
/// [TabProfileView]
class TabProfileRoute extends PageRouteInfo<void> {
  const TabProfileRoute({List<PageRouteInfo>? children})
    : super(TabProfileRoute.name, initialChildren: children);

  static const String name = 'TabProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabProfileView();
    },
  );
}

/// generated route for
/// [TabTodoView]
class TabTodoRoute extends PageRouteInfo<void> {
  const TabTodoRoute({List<PageRouteInfo>? children})
    : super(TabTodoRoute.name, initialChildren: children);

  static const String name = 'TabTodoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabTodoView();
    },
  );
}

/// generated route for
/// [TabsRootView]
class TabsRootRoute extends PageRouteInfo<void> {
  const TabsRootRoute({List<PageRouteInfo>? children})
    : super(TabsRootRoute.name, initialChildren: children);

  static const String name = 'TabsRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabsRootView();
    },
  );
}

/// generated route for
/// [TodoView]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute({List<PageRouteInfo>? children})
    : super(TodoRoute.name, initialChildren: children);

  static const String name = 'TodoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TodoView();
    },
  );
}
