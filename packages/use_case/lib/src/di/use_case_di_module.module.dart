//@GeneratedMicroModule;UseCasePackageModule;package:use_case/src/di/use_case_di_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:use_case/src/authorization/authorization_use_case_impl.dart'
    as _i832;
import 'package:use_case/src/todo/todo_use_case_impl.dart' as _i1063;

class UseCasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i494.AuthorizationUseCase>(() => _i832.AuthorizationUseCaseImpl(
        repository: gh<_i494.AuthorizationRepository>()));
    gh.singleton<_i494.TodoUseCases>(() =>
        _i1063.TodoUseCasesImpl(todoRepository: gh<_i494.TodoRepository>()));
  }
}
