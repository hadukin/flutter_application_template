import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/presentation/notes/notes_adapter.dart';
import 'package:notes/di/notes_di_module.dart';
import 'package:notes/presentation/notes_view.dart';

class NotesRoot extends StatefulWidget {
  const NotesRoot({super.key});

  @override
  State<NotesRoot> createState() => _NotesRootState();
}

class _NotesRootState extends State<NotesRoot> {
  @override
  Widget build(BuildContext context) {
    return DiScopeProviderWidget(
      scope: NotesDiModule(
        notesNavigationAdapter: NotesNavigationAdapterImpl(
          router: Di.instance.getIt(),
        ),
      ),
      builder: (context, scope) {
        return NotesView();
      },
    );
  }
}
