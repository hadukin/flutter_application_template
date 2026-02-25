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
      await Di.instance.ensureInitialized();
      await Di.instance.registerModule(UiDiModule());
      final router = Di.instance.getIt<Graph>();

      /// Example router listener
      router.navigator.state.listen((event) {
        print('LISTEN/ROUTE/URI: ${event.uri}');
      });

      runApp(
        EasyLocalization(
          path: Constants.easyLocalizationPath,
          fallbackLocale: Constants.fallbackLocale,
          supportedLocales: Constants.supportedLocales,
          child: App(router: router),
        ),
      );
    },
    (error, stackTrace) {
      Log.i.error('$error', error: error, stackTrace: stackTrace);
    },
  );
}
