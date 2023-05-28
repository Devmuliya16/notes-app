import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_maker/database/DataBase.dart';

//pages
import 'package:notes_maker/screen/notes_detail.dart';

//components
import 'package:notes_maker/components/gridview.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late AppDatabase database;
  var crossAxitcnt = 2;
  @override
  Widget build(BuildContext context) {
    //access the instance of the database using provider in current context
    database = Provider.of<AppDatabase>(context);

    //update parent widget from child
    updatePage() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => _setGrid(),
            icon: Icon(crossAxitcnt == 2
                ? Icons.grid_4x4
                : (crossAxitcnt == 3)
                    ? Icons.list
                    : Icons.grid_3x3),
            color: Colors.black,
          )
        ],
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
              return noteListUi(
                  notelist: notelist,
                  updatepage: updatePage,
                  crossAxiscnt: crossAxitcnt);
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
        onPressed: () => _navigateToDetail(title: "New note"),
        shape: CircleBorder(
          side: BorderSide(color: Colors.black, width: 2),
        ),
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Future<List<NoteData>> _getNotesFromDatabase() async {
    return await database.getAllNotes();
  }

  void _navigateToDetail({required String title}) async {
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotesDetail(
                  title: title,
                  note: NoteCompanion(
                    title: df.Value(''),
                    content: df.Value(''),
                    color: df.Value(0),
                    priority: df.Value(0),
                    category: df.Value(null),
                  ),
                )));
    if (res == true) {
      setState(() {});
    }
  }

  _setGrid() {
    crossAxitcnt = (crossAxitcnt == 1)
        ? 2
        : (crossAxitcnt == 2)
            ? 3
            : 1;
    setState(() {});
  }
}
