import 'dart:async';
import 'package:worker_manager/worker_manager.dart';

final class TaskWorker {
  static final TaskWorker _instance = TaskWorker._();

  TaskWorker._();

  static TaskWorker get instance => _instance;

  Future<void> init<R>({bool withLog = false}) async {
    workerManager.init();
    workerManager.log = withLog;
  }

  Cancelable<R> execute<R>(FutureOr<R> Function() execution) {
    return workerManager.execute(execution);
  }
}
