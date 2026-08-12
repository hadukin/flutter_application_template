// import 'package:domain/domain.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton()
// final class SignOutUseCase extends UseCase<void, EmptyUseCaseParams> {
//   final AuthorizationRepository _repository;

//   SignOutUseCase({
//     required AuthorizationRepository repository,
//   }) : _repository = repository;

//   @override
//   Future<UseCaseResult<void, Exception>> call(EmptyUseCaseParams params) => innerCall(_repository.signOut);
// }
