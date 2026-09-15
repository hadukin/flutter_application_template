typedef UseCaseResponse<T> = ({T? data, Exception? err});

abstract interface class UseCase<T, P extends UseCaseParam> {
  const UseCase();
  Future<UseCaseResponse<T>> call(P param);
}

abstract interface class UseCaseDisposable<T, P extends UseCaseParam> {
  const UseCaseDisposable();
  Future<UseCaseResponse<T>> call(P param);
  Future<void> dispose();
}

abstract interface class UseCaseParam {
  const UseCaseParam();
}

class EmptyUseCaseParam implements UseCaseParam {
  const EmptyUseCaseParam();
}
