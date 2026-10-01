import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotesDetailView extends StatefulWidget {
  const NotesDetailView({super.key});

  @override
  State<NotesDetailView> createState() => _NotesDetailViewState();
}

class _NotesDetailViewState extends State<NotesDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('detail')),
          ElevatedButton(onPressed: () {}, child: Text('profile')),
        ],
      ),
    );
  }
}
