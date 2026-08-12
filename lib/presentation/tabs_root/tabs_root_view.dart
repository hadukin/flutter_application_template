import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_template/router/auto_router_impl/app_router.dart';

final _currentIndex = ValueNotifier<int>(0);

@RoutePage()
class TabsRootView extends StatelessWidget {
  const TabsRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AutoTabsScaffold(
        routes: const [TabHomeRoute(), TabTodoRoute(), TabProfileRoute()],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CupertinoTabBar(
            onTap: (index) {
              _currentIndex.value = index;
              if (_currentIndex.value == tabsRouter.activeIndex && tabsRouter.canNavigateBack) {
                tabsRouter.popTop();
              } else {
                tabsRouter.setActiveIndex(index);
              }
            },
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(activeIcon: Icon(CupertinoIcons.home), icon: Icon(CupertinoIcons.home)),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.list_bullet),
                icon: Icon(CupertinoIcons.list_bullet),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.profile_circled),
                icon: Icon(CupertinoIcons.profile_circled),
              ),
            ],
          );
        },
      ),
    );
  }
}
