import 'package:domain/domain.dart';

final class GetAllUserUseCase extends UseCase<List<UserEntity>, EmptyUseCaseParams> {
  final AuthorizationRepository _repository;

  GetAllUserUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<UseCaseResult<List<UserEntity>, Exception>> call(
    EmptyUseCaseParams params,
  ) =>
      innerCall(
        () => _repository.getUsers(),
      );
}
