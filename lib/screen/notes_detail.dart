import 'package:flutter/material.dart';
import 'package:notes_maker/database/DataBase.dart';

class NotesDetail extends StatefulWidget {
  final String title;
  final NoteCompanion noteCompanion;
  const NotesDetail(
      {Key? key, required this.title, required this.noteCompanion})
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getDetailAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleinputController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: 'Title'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: descriptionController,
                maxLength: 225,
                minLines: 7,
                maxLines: 8,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: 'Description'),
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
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.save,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.delete, color: Colors.black))
      ],
    );
  }
}
