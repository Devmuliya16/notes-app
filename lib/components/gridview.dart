import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_maker/screen/notes_detail.dart';
import 'package:drift/drift.dart' as df;

//database
import '../database/DataBase.dart';

//components
import '../components/elements.dart';

class noteListUi extends StatefulWidget {
  noteListUi(
      {super.key,
      required this.notelist,
      required this.updatepage,
      required this.crossAxiscnt});

  final List<NoteData> notelist;
  final Function updatepage;
  var crossAxiscnt = 2;

  @override
  State<noteListUi> createState() => _noteListUiState();
}

class _noteListUiState extends State<noteListUi> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisCount: widget.crossAxiscnt,
        itemBuilder: (context, index) {
          NoteData note = widget.notelist[index];
          return InkWell(
            onTap: () => {_navigatetoDetailsPage('Edit note', note)},
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.black)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(note.title,
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        getBadge(priority: note.priority ?? 0)
                      ],
                    ),
                    Text(note.content),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '25/5/2023',
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    )
                  ]),
            ),
          );
        },
        itemCount: widget.notelist.length);
  }

  _navigatetoDetailsPage(String title, NoteData note) async {
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotesDetail(
                title: title,
                note: NoteCompanion(
                    id: df.Value(note.id),
                    title: df.Value(note.title),
                    category: df.Value(note.category),
                    content: df.Value(note.content),
                    color: df.Value(note.color),
                    priority: df.Value(note.priority)))));
    if (res == true) {
      widget.updatepage();
    }
  }
}
