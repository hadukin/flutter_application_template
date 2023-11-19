import 'package:domain/domain.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/constants.dart';
import 'package:flutter_application_template/generated/locale_keys.g.dart';

class App extends StatelessWidget {
  final BaseRouter router;

  const App({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      scaffoldMessengerKey: Constants.scaffoldMessengerKey,
      title: LocaleKeys.common_app_name.tr(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child!,
      ),
      routeInformationProvider: router.config.routeInformationProvider,
      routerDelegate: router.config.routerDelegate,
      routeInformationParser: router.config.routeInformationParser,
    );
  }
}
