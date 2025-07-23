import 'package:flutter/material.dart';

abstract class Constants {
  const Constants();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static const easyLocalizationPath = 'assets/translations';
  static const localeEn = Locale('en', 'US');
  static const localeRu = Locale('ru', 'RU');
  static const fallbackLocale = Locale('ru', 'RU');
  static const supportedLocales = [Locale('ru', 'RU'), Locale('en', 'US')];
}
