import 'dart:async';

import 'package:di/di.dart';
import 'package:notes/notes.dart';

class NotesDiModule({
  required final NotesNavigationAdapter _notesNavigationAdapter,
}) implements BaseScope {
  NotesNavigationAdapter get notesNavigationAdapter => Di.instance.getIt();

  @override
  FutureOr<dynamic> dispose() {}

  @override
  Future<bool> init(Di getit) async {
    getit.registerSingleton(_notesNavigationAdapter);
    return true;
  }

  @override
  bool isReady = false;

  @override
  String get name => 'notes-scope';

  @override
  FutureOr<dynamic> onDispose() {
    print('DISPOSE: ${name}');
  }
}
