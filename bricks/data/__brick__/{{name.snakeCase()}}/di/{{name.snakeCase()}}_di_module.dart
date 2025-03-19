import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:data/src/{{name.snakeCase()}}/data_source/local/{{name.snakeCase()}}_local_data_source.dart';
import 'package:data/src/{{name.snakeCase()}}/data_source/local/{{name.snakeCase()}}_local_data_source_impl.dart';
import 'package:data/src/{{name.snakeCase()}}/data_source/remote/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:data/src/{{name.snakeCase()}}/data_source/remote/{{name.snakeCase()}}_remote_data_source_impl.dart';
import 'package:data/src/{{name.snakeCase()}}/repository/{{name.snakeCase()}}_repository_impl.dart';

class {{name.pascalCase()}}DiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerSingleton<{{name.pascalCase()}}RemoteDataSource>(
      {{name.pascalCase()}}RemoteDataSourceImpl(),
    );

    instance.registerSingleton<{{name.pascalCase()}}LocalDataSource>(
      {{name.pascalCase()}}LocalDataSourceImpl(),
    );

    instance.registerSingleton<{{name.pascalCase()}}Repository>(
      {{name.pascalCase()}}RepositoryImpl(
        remote: instance.getIt(),
        local: instance.getIt(),
      ),
    );
  }
}
