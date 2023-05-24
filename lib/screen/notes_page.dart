import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_maker/database/DataBase.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late AppDatabase database;
  @override
  Widget build(BuildContext context) {
    //access the instance of the database using provider in current context
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('insert title',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: FutureBuilder<List<NoteData>>(
          future: _getNotesFromDatabase(),
          builder: (context, snapshot) => {
            if (snapshot.hasData) {if (snapshot.data != null) {}}
          },
        ));
  }

  _getNotesFromDatabase() {
    database.getAllNotes();
  }
}
