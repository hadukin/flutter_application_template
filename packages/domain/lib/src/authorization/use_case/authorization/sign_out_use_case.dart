import 'package:domain/domain.dart';

final class SignOutUseCase extends UseCase<void, EmptyUseCaseParams> {
  final AuthorizationRepository _repository;
  final TokensStore _tokensStore;

  SignOutUseCase({
    required AuthorizationRepository repository,
    required TokensStore tokensStore,
  })  : _repository = repository,
        _tokensStore = tokensStore;

  @override
  Future<UseCaseResult<void, Exception>> call(EmptyUseCaseParams params) => innerCall(
        () async {
          try {
            await _repository.signOut();
            _tokensStore.setValue(null);
          } catch (e) {
            rethrow;
          }
        },
      );
}
