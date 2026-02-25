import 'package:data/src/todo/data_source/local/todo_local_data_source.dart';
import 'package:data/src/todo/data_source/local/todo_local_data_source_impl.dart';
import 'package:data/src/todo/repository/todo_repository_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:use_case/use_case.dart';

class TodoDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerLazySingleton<TodoLocalDataSource>(
      TodoLocalDataSourceImpl(
        db: instance.getIt(),
      ),
    );

    instance.registerLazySingleton<TodoRepository>(
      TodoRepositoryImpl(
        todoLocalDataSource: instance.getIt(),
      ),
    );

    instance.registerLazySingleton<TodoUseCases>(TodoUseCasesImpl(
      todoRepository: instance.getIt(),
    ));
  }
}
