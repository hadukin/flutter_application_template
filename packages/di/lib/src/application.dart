// import 'package:data/data.dart';
// import 'package:di/di.dart';
// import 'package:domain/domain.dart';
// import 'package:network/network.dart';
// import 'package:storage/storage.dart';

// final class Application {
//   static const Application _instance = Application._();

//   const Application._();

//   static Application get instance => _instance;

//   Future<void> registerDependencies() async {
//     // await Di.instance.registerModule(const StorageDiModule());
//     // await Di.instance.registerModule(const NetworkDiModule());
//     // await Di.instance.registerModule(const DataDiModule());
//     await _checkTokens();
//   }

//   Future<void> _checkTokens() async {
//     final tokens = await Di.instance.getIt<GetTokensFromLocalStorageUseCase>().call(
//           const EmptyUseCaseParams(),
//         );

//     final tokenStore = Di.instance.getIt<TokenStore>();

//     switch (tokens) {
//       case UseCaseSuccess(data: final credentials):
//         tokenStore.setValue(credentials);
//       case UseCaseFailure(exception: final error):
//         print(error);
//     }
//   }
// }
