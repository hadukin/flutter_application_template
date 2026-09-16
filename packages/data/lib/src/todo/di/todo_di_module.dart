import 'dart:async';

import 'package:data/src/todo/data_source/local/todo_local_data_source.dart';
import 'package:data/src/todo/data_source/local/todo_local_data_source_impl.dart';
import 'package:data/src/todo/repository/todo_repository_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';

class TodoDiModule implements BaseDiModule, BaseScope {
  @override
  bool isReady = false;

  TodoAddUseCase get todoAddUseCase => Di.instance.getIt();

  TodoGetAllUseCase get todoGetAllUseCase => Di.instance.getIt();

  @override
  Future<void> register(Di instance) async {
    instance.registerLazySingleton<TodoLocalDataSource>(
      TodoLocalDataSourceImpl(db: instance.getIt()),
    );

    instance.registerLazySingleton<TodoRepository>(
      TodoRepositoryImpl(todoLocalDataSource: instance.getIt()),
    );

    instance.registerFactory(
      () => TodoAddUseCase(repository: instance.getIt()),
    );
    instance.registerFactory(
      () => TodoGetAllUseCase(repository: instance.getIt()),
    );

    isReady = true;
  }

  @override
  FutureOr<dynamic> dispose() {
    isReady = false;
  }

  @override
  Future<bool> init(Di getit) async {
    await getit.registerModule(this);
    return isReady;
  }

  @override
  String get name => 'todo-scope';
}
