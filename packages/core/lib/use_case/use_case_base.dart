import 'dart:async';

import 'package:core/logger/logger_impl.dart';
import 'package:flutter/foundation.dart';

sealed class UseCaseResult<T, E extends Exception> {
  const UseCaseResult();
}

final class UseCaseSuccess<T, E extends Exception> extends UseCaseResult<T, E> {
  const UseCaseSuccess(this.data);
  final T data;
}

final class UseCaseFailure<T, E extends Exception> extends UseCaseResult<T, E> {
  const UseCaseFailure(this.exception);
  final E exception;
}

/// Example:
/// ```
/// final class IsAuthorizedUseCase extends UseCase<Tokens, EmptyUseCaseParams> {
///   final AuthorizationRepository _repository;
///
///   IsAuthorizedUseCase({
///     required AuthorizationRepository repository,
///   }) : _repository = repository;
///
///   @override
///   Future<UseCaseResult<Tokens, Exception>> call(EmptyUseCaseParams params) => innerCall(
///         () => _repository.isAuthorized(),
///       );
/// }
/// ```
abstract base class UseCase<Type, Params> {
  Future<UseCaseResult<Type, Exception>> call(Params params);

  @protected
  Future<UseCaseResult<Type, Exception>> innerCall(
    Future<Type> Function() func,
  ) async {
    try {
      final result = await func.call();
      return UseCaseSuccess<Type, Exception>(result);
    } catch (error, stackTrace) {
      Log.i.error('${error}', error: error, stackTrace: stackTrace);
      return UseCaseFailure<Type, Exception>(Exception(error));
    }
  }
}

/// ```
/// final class IsAuthorizedUseCase extends StreamUseCase<Tokens, EmptyUseCaseParams> {
///   final AuthorizationRepository _repository;
///
///   IsAuthorizedUseCase({
///     required AuthorizationRepository repository,
///   }) : _repository = repository;
///
///   @override
///   Stream<UseCaseResult<Tokens, Exception>> call(params) async* {
///     try {
///       final result = await _repository.isAuthorized();
///       controller.add(UseCaseSuccess(result));
///     } catch (error) {
///       controller.add(UseCaseFailure(Exception('$error')));
///     }
///
///     yield* controller.stream;
///   }
///
///   @override
///   Future<void> cancel() async {
///     controller.close();
///   }
/// }
/// ```
abstract base class StreamUseCase<Type, Params> {
  Stream<UseCaseResult<Type, Exception>> call(Params params);

  @protected
  final StreamController<UseCaseResult<Type, Exception>> controller = StreamController.broadcast();

  Future<void> cancel();

  // @protected
  // Stream<UseCaseResult<Type, Exception>> innerCall(Future<Type> Function() func) async* {
  //   try {
  //     final result = await func.call();
  //     yield UseCaseSuccess<Type, Exception>(result);
  //   } catch (e) {
  //     yield UseCaseFailure<Type, Exception>(e as Exception);
  //   }
  // }
}

abstract base class SyncUseCase<Type, Params> {
  UseCaseResult<Type, Exception> call(Params params);

  @protected
  UseCaseResult<Type, Exception> innerCall(Type Function() func) {
    try {
      final result = func.call();
      return UseCaseSuccess<Type, Exception>(result);
    } catch (error, stackTrace) {
      Log.i.error('${error}', error: error, stackTrace: stackTrace);
      return UseCaseFailure<Type, Exception>(Exception(error));
    }
  }
}

final class EmptyUseCaseParams {
  const EmptyUseCaseParams();
}
