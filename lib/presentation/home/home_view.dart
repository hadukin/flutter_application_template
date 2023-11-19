import 'package:auto_route/auto_route.dart';

import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Di.instance.getIt<IRouter>().navigator.navigate(
                    '/profile/details/uuid-12345678',
                    queryArgs: {'userName': 'anatoly'},
                  );
                },
                child: Text('Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Di.instance.getIt<IRouter>().navigator.push('/home/bottom-sheet-example');
                },
                child: Text('Open sheet'),
              ),
              ElevatedButton(
                onPressed: () {
                  Di.instance.getIt<IRouter>().navigator.push('/bottom-sheet-example');
                },
                child: Text('Open sheet root'),
              ),
              ElevatedButton(
                onPressed: () {
                  Di.instance.getIt<IRouter>().navigator.push('/root-dialog-example');
                },
                child: Text('Open dialog root'),
              ),
              ElevatedButton(
                onPressed: () {
                  Di.instance.getIt<IRouter>().navigator.push('/root-cupertino-dialog-example');
                },
                child: Text('Open cuprtino dialog root'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
