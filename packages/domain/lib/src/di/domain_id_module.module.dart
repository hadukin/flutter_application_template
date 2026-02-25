//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/domain_id_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/authorization/use_case/get_tokens_from_local_storage_use_case.dart'
    as _i367;
import 'package:domain/src/authorization/use_case/sign_in_use_case.dart'
    as _i527;
import 'package:domain/src/authorization/use_case/sign_out_use_case.dart'
    as _i475;
import 'package:domain/src/todo/use_case/todo_use_cases_impl.dart' as _i390;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i367.GetTokensFromLocalStorageUseCase>(() =>
        _i367.GetTokensFromLocalStorageUseCase(
            repository: gh<_i494.AuthorizationRepository>()));
    gh.lazySingleton<_i527.SignInUseCase>(() =>
        _i527.SignInUseCase(repository: gh<_i494.AuthorizationRepository>()));
    gh.lazySingleton<_i475.SignOutUseCase>(() =>
        _i475.SignOutUseCase(repository: gh<_i494.AuthorizationRepository>()));
    gh.singleton<_i494.TodoUseCases>(() =>
        _i390.TodoUseCasesImpl(todoRepository: gh<_i494.TodoRepository>()));
  }
}
