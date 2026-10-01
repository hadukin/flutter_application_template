import 'package:di/di.dart';
import 'package:flutter/material.dart';

import 'package:notes/di/notes_di_module.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context
                  .scope<NotesDiModule>()
                  ?.data
                  .notesNavigationAdapter
                  .goProfile();
            },
            child: Text('profile'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('profile')),
        ],
      ),
    );
  }
}
