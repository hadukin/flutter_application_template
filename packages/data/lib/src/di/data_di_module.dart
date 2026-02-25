// import 'package:data/src/analytics/di/analytics_di_module.dart';
// import 'package:data/src/authorization/di/authorization_di_module.dart';
// import 'package:data/src/store/store_di_module.dart';
// import 'package:data/src/todo/di/todo_di_module.dart';
// import 'package:di/di.dart';
// import 'package:injectable/injectable.dart';

// class DataDiModule implements BaseDiModule {
//   const DataDiModule();

//   @override
//   Future<void> register(Di instance) async {
//     final modules = [
//       StoreDiModule(),
//       AnalyticsDiModule(),
//       AuthorizationDiModule(),
//       TodoDiModule(),
//     ];

//     for (final module in modules) {
//       await module.register(instance);
//     }
//   }
// }

import 'package:injectable/injectable.dart';

@InjectableInit.microPackage()
Future<void> initMicroPackage() async {}
