import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/presentation/home/home_view.dart';
import 'package:flutter_application_template/presentation/launch/launch_view.dart';
import 'package:flutter_application_template/presentation/profile/profile_details_view.dart';
import 'package:flutter_application_template/presentation/profile/profile_view.dart';
import 'package:flutter_application_template/presentation/todo/todo_view.dart';
import 'package:flutter_application_template/router/go_router_impl/go_router_impl.dart';
import 'package:flutter_application_template/router/go_router_impl/part/dialog_page.dart';
import 'package:flutter_application_template/router/go_router_impl/part/modal_bottom_sheet_page.dart';
import 'package:flutter_application_template/ui_di_module.dart';

import 'package:go_router/go_router.dart';

final class GoRoutingSetupImpl implements IRouterBuilder {
  const GoRoutingSetupImpl();

  @override
  IRouter<GoRouter, RouterDetails> build({String? initialPath}) {
    return GoRouterImpl(
      router: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: initialPath ?? '/launch',
        routes: <RouteBase>[
          GoRoute(
            path: '/launch',
            builder: (context, state) {
              return const LaunchView();
            },
          ),
          GoRoute(
            path: '/root-dialog-example',
            pageBuilder: (context, state) {
              return const DialogPage(
                child: Padding(padding: EdgeInsets.all(20.0), child: Text('Dialog')),
              );
            },
          ),
          GoRoute(
            path: '/root-cupertino-dialog-example',
            pageBuilder: (context, state) {
              return const CupertinoDialogPage(
                child: Padding(padding: EdgeInsets.all(20.0), child: Text('Cupertino dialog')),
              );
            },
          ),
          GoRoute(
            path: '/bottom-sheet-example',
            pageBuilder: (context, state) {
              return ModalBottomSheetPage(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bottom sheet content'),
                          IconButton(
                            onPressed: () {
                              Di.instance.getIt<Graph>().navigator.pop();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, shell) {
              return _ScaffoldWithBottomNavigation(
                currentIndex: shell.currentIndex,
                onTabTap: (int index) {
                  if (shell.currentIndex == index) {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  } else {
                    shell.goBranch(index);
                  }
                },
                body: shell,
                tabs: const [
                  _TabItem(icon: Icons.home, label: 'Home'),
                  _TabItem(icon: Icons.list, label: 'Todo'),
                  _TabItem(icon: Icons.settings, label: 'Profile'),
                ],
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/home',
                    builder: (context, state) {
                      return const HomeView();
                    },
                    routes: [
                      GoRoute(
                        path: 'bottom-sheet-example',
                        pageBuilder: (context, state) {
                          return ModalBottomSheetPage(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Bottom sheet content'),
                                      IconButton(
                                        onPressed: () {
                                          Di.instance.getIt<Graph>().navigator.pop();
                                        },
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/todo',
                    builder: (context, state) {
                      return const TodoView();
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    builder: (context, state) {
                      return const ProfileView();
                    },
                    routes: [
                      GoRoute(
                        path: 'details/:userId',
                        builder: (context, state) {
                          return ProfileDetailsView(
                            userId: state.pathParameters['userId'],
                            userName: state.uri.queryParameters['userName'],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// final _goRouter = GoRouter(
//   debugLogDiagnostics: true,
//   initialLocation: '/launch',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/launch',
//       builder: (context, state) {
//         return const LaunchView();
//       },
//     ),
//     GoRoute(
//       path: '/root-dialog-example',
//       pageBuilder: (context, state) {
//         return const DialogPage(
//           child: Padding(padding: EdgeInsets.all(20.0), child: Text('Dialog')),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/root-cupertino-dialog-example',
//       pageBuilder: (context, state) {
//         return const CupertinoDialogPage(
//           child: Padding(padding: EdgeInsets.all(20.0), child: Text('Cupertino dialog')),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/bottom-sheet-example',
//       pageBuilder: (context, state) {
//         return ModalBottomSheetPage(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Bottom sheet content'),
//                     IconButton(
//                       onPressed: () {
//                         Di.instance.getIt<Graph>().navigator.pop();
//                       },
//                       icon: Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, shell) {
//         return _ScaffoldWithBottomNavigation(
//           currentIndex: shell.currentIndex,
//           onTabTap: (int index) {
//             if (shell.currentIndex == index) {
//               if (GoRouter.of(context).canPop()) {
//                 GoRouter.of(context).pop();
//               }
//             } else {
//               shell.goBranch(index);
//             }
//           },
//           body: shell,
//           tabs: const [
//             _TabItem(icon: Icons.home, label: 'Home'),
//             _TabItem(icon: Icons.list, label: 'Todo'),
//             _TabItem(icon: Icons.settings, label: 'Profile'),
//           ],
//         );
//       },
//       branches: [
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: '/home',
//               builder: (context, state) {
//                 return const HomeView();
//               },
//               routes: [
//                 GoRoute(
//                   path: 'bottom-sheet-example',
//                   pageBuilder: (context, state) {
//                     return ModalBottomSheetPage(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Bottom sheet content'),
//                                 IconButton(
//                                   onPressed: () {
//                                     Di.instance.getIt<Graph>().navigator.pop();
//                                   },
//                                   icon: Icon(Icons.close),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: '/todo',
//               builder: (context, state) {
//                 return const TodoView();
//               },
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: '/profile',
//               builder: (context, state) {
//                 return const ProfileView();
//               },
//               routes: [
//                 GoRoute(
//                   path: 'details/:userId',
//                   builder: (context, state) {
//                     return ProfileDetailsView(
//                       userId: state.pathParameters['userId'],
//                       userName: state.uri.queryParameters['userName'],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );

class _ScaffoldWithBottomNavigation extends StatelessWidget {
  const _ScaffoldWithBottomNavigation({
    required this.body,
    required this.tabs,
    required this.currentIndex,
    required this.onTabTap,
  });

  final Widget body;
  final List<_TabItem> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTabTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTap,
        items: tabs.map((tab) {
          return BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label);
        }).toList(),
      ),
    );
  }
}

class _TabItem {
  const _TabItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
