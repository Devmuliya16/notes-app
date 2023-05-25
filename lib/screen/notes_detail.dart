import 'package:flutter/material.dart';
import 'package:notes_maker/database/DataBase.dart';
import 'package:drift/drift.dart' as db;
import 'package:provider/provider.dart';

import '../components/Inputs.dart';

class NotesDetail extends StatefulWidget {
  final String title;
  final NoteCompanion note;
  const NotesDetail({Key? key, required this.title, required this.note})
      : super(key: key);

  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  late AppDatabase database;
  late TextEditingController titleinputController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    titleinputController = TextEditingController();
    descriptionController = TextEditingController();
    titleinputController.text = widget.note.title.value;
    descriptionController.text = widget.note.content.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: _getDetailAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              getInputOutlined(
                  controller: titleinputController, labeltext: "title"),
              SizedBox(
                height: 20.0,
              ),
              getInputOutlined(
                controller: descriptionController,
                labeltext: "description",
                maxLen: 255,
                maxL: 10,
                minL: 8,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getDetailAppbar() {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left, color: Colors.black)),
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {
              _saveNote();
            },
            icon: Icon(
              Icons.save,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () => _deleteNote(),
            icon: Icon(Icons.delete, color: Colors.black))
      ],
    );
  }

  // save new note
  void _saveNote() {
    if (widget.note.id.present) {
      database
          .updateNote(NoteData(
              id: widget.note.id.value,
              title: titleinputController.text,
              content: descriptionController.text,
              color: 1,
              category: 1,
              priority: 1))
          .then((value) {
        print(value);
        Navigator.pop(context, true);
        print("updated");
      }).catchError((error) => print(error.toString()));
    } else {
      database
          .insertNote(NoteCompanion(
              title: db.Value(titleinputController.text),
              content: db.Value(descriptionController.text),
              category: db.Value(1),
              color: db.Value(1)))
          .then((value) => Navigator.pop(context, true))
          .catchError((error) => print(error.toString()));
    }
  }

  // delete note
  void _deleteNote() {
    //set alert
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Note'),
            content: Text('do you want to delete ${widget.note.title.value} ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    database
                        .deleteNote(NoteData(
                          id: widget.note.id.value,
                          title: widget.note.title.value,
                          content: widget.note.content.value,
                        ))
                        .then((value) => Navigator.pop(context, true))
                        .catchError((error) => print(error.toString()));
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }
}
