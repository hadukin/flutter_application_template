import 'dart:async';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/constants.dart';
import 'package:flutter_application_template/presentation/app/app.dart';
import 'package:flutter_application_template/ui_di_module.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await TaskWorker.instance.init();
      await Application.instance.registerDependencies();
      await Di.instance.registerModule(UiDiModule());
      runApp(EasyLocalization(
        path: Constants.easyLocalizationPath,
        fallbackLocale: Constants.fallbackLocale,
        supportedLocales: Constants.supportedLocales,
        child: App(router: Di.instance.getIt<IRouter>()),
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
