// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ru_RU = {
  "common": {
    "app_name": "Шаблон приложения"
  },
  "launch": {
    "title": "Стартовый экран"
  }
};
static const Map<String,dynamic> _en_US = {
  "common": {
    "app_name": "Application Template"
  },
  "launch": {
    "title": "Launch view"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru_RU": _ru_RU, "en_US": _en_US};
}
