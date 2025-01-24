import 'package:domain/domain.dart';

final class GetTokensFromLocalStorageUseCase extends UseCase<TokensEntity, EmptyUseCaseParams> {
  final AuthorizationRepository _repository;

  GetTokensFromLocalStorageUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<UseCaseResult<TokensEntity, Exception>> call(EmptyUseCaseParams params) => innerCall(
        () async {
          try {
            final tokens = await _repository.getTokens();

            return tokens;
          } catch (e) {
            rethrow;
          }
        },
      );
}
