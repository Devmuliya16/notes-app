import 'package:flutter/material.dart';

//pages
import 'screen/notes_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: 'Carlito',
                  fontWeight: FontWeight.bold,
                  fontSize: 24))),
      home: NotesPage(),
    );
  }
}
