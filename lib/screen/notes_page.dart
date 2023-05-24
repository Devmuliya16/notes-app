import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:notes_maker/screen/notes_detail.dart';
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
        title: Text('Notes', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: FutureBuilder<List<NoteData>>(
        future: _getNotesFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NoteData>? notelist = snapshot.data;
            if (snapshot.data!.isEmpty || notelist!.isEmpty) {
              return Center(
                child: Text(
                  'No notes found click on add button and create notes',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            } else {
              return noteListUi(notelist);
            }
          } else if (snapshot.hasError) {
            return Center(
                child: Text(snapshot.error.toString(),
                    textAlign: TextAlign.center));
          }
          return Center();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToDetail(
            title: "note title",
            noteCompanion: const NoteCompanion(
                id: Value(1),
                title: Value(''),
                content: Value(''),
                color: Value(1),
                priority: Value(1))),
        shape: CircleBorder(
          side: BorderSide(color: Colors.black, width: 2),
        ),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Future<List<NoteData>> _getNotesFromDatabase() async {
    return await database.getAllNotes();
  }

  Widget noteListUi(List<NoteData> notes) {
    return Center();
  }

  void _navigateToDetail(
      {required String title, required NoteCompanion noteCompanion}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotesDetail(
                  title: title,
                  noteCompanion: noteCompanion,
                )));
  }
}
