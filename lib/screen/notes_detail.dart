import 'package:flutter/material.dart';

class NotesDetail extends StatefulWidget {
  const NotesDetail({super.key});

  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('insert title'),
      ),
      body: Center(
        child: Text('place content here'),
      ),
    );
  }
}
