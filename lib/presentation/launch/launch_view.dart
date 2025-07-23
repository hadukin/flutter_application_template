import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/constants.dart';
import 'package:flutter_application_template/generated/assets.gen.dart';
import 'package:flutter_application_template/generated/locale_keys.g.dart';
import 'package:flutter_application_template/presentation/launch/launch_view_model.dart';
import 'package:flutter_application_template/ui_di_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  final _emailController = TextEditingController(text: 'test@email.com');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LaunchViewModel(
          router: Di.instance.getIt(),
          signInUseCase: Di.instance.getIt(),
          snackBarService: Di.instance.getIt(),
        );
      },
      child: BlocBuilder<LaunchViewModel, LaunchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(LocaleKeys.launch_title.tr())),
            body: SingleChildScrollView(
              child: Center(
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(LocaleKeys.common_app_name.tr(), textAlign: TextAlign.center),
                      const SizedBox(height: 40),
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: Assets.launcherIcon.icLauncher.provider()),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        decoration: const InputDecoration(hintText: 'Email'),
                        controller: _emailController,
                      ),
                      ElevatedButton(
                        onPressed: state.isLoading ? null : context.read<LaunchViewModel>().signIn,
                        child: state.isLoading
                            ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator.adaptive(strokeWidth: 2))
                            : const Text('Login'),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              context.setLocale(Constants.localeEn);
                            },
                            child: const Text('EN locale'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.setLocale(Constants.localeRu);
                            },
                            child: const Text('RU locale'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
