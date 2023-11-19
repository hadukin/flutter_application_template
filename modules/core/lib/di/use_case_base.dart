import 'package:flutter/foundation.dart';

sealed class UseCaseBaseResult<T, E extends Exception> {
  const UseCaseBaseResult();
}

final class UseCaseBaseSuccess<T, E extends Exception>
    extends UseCaseBaseResult<T, E> {
  const UseCaseBaseSuccess(this.data);
  final T data;
}

final class UseCaseBaseFailure<T, E extends Exception>
    extends UseCaseBaseResult<T, E> {
  const UseCaseBaseFailure(this.exception);
  final E exception;
}

abstract class UseCaseBase<Type, Params> {
  Future<UseCaseBaseResult<Type, Exception>> call(Params params);

  @protected
  Future<UseCaseBaseResult<Type, Exception>> innerCall(
      Future<Type> Function() func) async {
    try {
      final result = await func.call();
      return UseCaseBaseSuccess<Type, Exception>(result);
    } catch (e) {
      return UseCaseBaseFailure<Type, Exception>(e as Exception);
    }
  }
}

// class DeleteAccountUseCase extends UseCaseBase<UserEntity?, EmptyUseCaseParams> {
//   final AuthorizationRepository _repository;

//   DeleteAccountUseCase({
//     required AuthorizationRepository repository,
//   }) : _repository = repository;

//   @override
//   Future<UseCaseBaseResult<UserEntity?, FailureException>> call(EmptyUseCaseParams params) => innerCall(
//         () => _repository.getUser(),
//       );
// }

// Future<void> das() async {
//   final usecase = DeleteAccountUseCase(repository: getIt());

//   final result = await usecase(EmptyUseCaseParams());

//   switch (result) {
//     case UseCaseBaseSuccess(data: final user):
//       print(user?.email);
//       break;
//     case UseCaseBaseFailure(exception: final error):
//       print(error.message);
//       break;
//   }
// }

// Future<UseCaseBaseResult<String, Exception>> getLocationFromIP() async {
//   try {
//     return const UseCaseBaseSuccess('dasdsa');
//     // return UseCaseBaseFailure(Exception('dasdsa'));
//   } on Exception catch (e) {
//     // 4. return UseCaseBaseFailure here too
//     return UseCaseBaseFailure(e);
//   }
// }

// Future<void> dasdsa() async {
//   final result = await getLocationFromIP();
//   switch (result) {
//     case UseCaseBaseSuccess(data: final value):
//       print(value);
//       break;
//     case UseCaseBaseFailure(exception: final error):
//       print(error);
//       break;
//   }
// }
