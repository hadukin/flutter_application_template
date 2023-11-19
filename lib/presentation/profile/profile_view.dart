import 'package:auto_route/auto_route.dart';
import 'package:core/router/base_router.dart';
import 'package:core/task_worker/task_worker.dart';
import 'package:core/use_case/use_case_base.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    int data = 0;
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            StatefulBuilder(
              builder: (context, setState) {
                return IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: Text('RESULT: ${isLoading ? 'Loading...' : data}')),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            data = 0;
                            isLoading = true;
                          });
                          final result = await TaskWorker.instance.execute(() {
                            return _fibonacci(40);
                          });
                          setState(() {
                            data = result;
                            isLoading = false;
                          });
                        },
                        child: const Text('Calculation with TaskWorker'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            data = 0;
                            isLoading = true;
                          });
                          await Future.delayed(const Duration(milliseconds: 500));
                          final result = _fibonacci(40);
                          setState(() {
                            data = result;
                            isLoading = false;
                          });
                        },
                        child: const Text('Calculation without TaskWorker'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final usecase = Di.instance.getIt<SignOutUseCase>();

                          await usecase(const EmptyUseCaseParams());

                          Di.instance.getIt<BaseRouter>().navigator.navigate('/launch');
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

int _fibonacci(int n) {
  int number1 = n - 1;
  int number2 = n - 2;
  if (0 == n) {
    return 0;
  } else if (1 == n) {
    return 1;
  } else {
    return (_fibonacci(number1) + _fibonacci(number2));
  }
}
