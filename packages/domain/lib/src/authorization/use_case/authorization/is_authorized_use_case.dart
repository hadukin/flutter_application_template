import 'package:domain/domain.dart';

final class IsAuthorizedUseCase extends UseCase<Tokens, EmptyUseCaseParams> {
  final AuthorizationRepository _repository;
  final TokensStore _tokensStore;

  IsAuthorizedUseCase({
    required AuthorizationRepository repository,
    required TokensStore tokensStore,
  })  : _repository = repository,
        _tokensStore = tokensStore;

  @override
  Future<UseCaseResult<Tokens, Exception>> call(EmptyUseCaseParams params) => innerCall(
        () async {
          try {
            final tokens = await _repository.isAuthorized();
            _tokensStore.setValue((
              access: tokens?.access,
              refresh: tokens?.refresh,
            ));
            return tokens;
          } catch (e) {
            rethrow;
          }
        },
      );
}
