import 'dart:async';
import 'package:core/logger/logger_impl.dart';
import 'package:core/router/base_router.dart';
import 'package:core/task_worker/task_worker.dart';
import 'package:core/use_case/use_case_base.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/constants.dart';
import 'package:flutter_application_template/env.dart';
import 'package:flutter_application_template/presentation/app/app.dart';
import 'package:flutter_application_template/ui_di_module.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      TaskWorker.instance.init();

      await Application.instance.installDependencies(
        baseUrl: AppEnv.instance.baseUrl,
        isDebug: AppEnv.instance.isDebug,
      );
      await Di.instance.installModule(UiDiModule());

      final router = Di.instance.getIt<BaseRouter>();

      await Di.instance.getIt<IsAuthorizedUseCase>()(const EmptyUseCaseParams());

      runApp(EasyLocalization(
        path: Constants.easyLocalizationPath,
        fallbackLocale: Constants.fallbackLocale,
        supportedLocales: Constants.supportedLocales,
        child: App(router: router),
      ));
    },
    (error, stackTrace) {
      Log.i.error(
        '$error',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
