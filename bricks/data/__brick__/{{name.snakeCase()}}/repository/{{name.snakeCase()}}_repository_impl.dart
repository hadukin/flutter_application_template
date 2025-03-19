import 'package:data/src/{{name.snakeCase()}}/data_source/local/{{name.snakeCase()}}_local_data_source.dart';
import 'package:data/src/{{name.snakeCase()}}/data_source/remote/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:domain/domain.dart';

final class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource _remote;
  final {{name.pascalCase()}}LocalDataSource _local;

  const {{name.pascalCase()}}RepositoryImpl({
    required {{name.pascalCase()}}RemoteDataSource remote,
    required {{name.pascalCase()}}LocalDataSource local,
  })  : _remote = remote,
        _local = local;
}
