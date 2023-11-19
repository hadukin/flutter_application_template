import 'package:core/use_case/use_case_base.dart';
import 'package:domain/domain.dart';

final class SaveUserUseCase extends UseCase<void, UserEntity> {
  final AuthorizationRepository _repository;

  SaveUserUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<UseCaseResult<void, Exception>> call(UserEntity user) => innerCall(
        () => _repository.saveUser(user),
      );
}
