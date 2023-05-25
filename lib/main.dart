import 'package:flutter/material.dart';
import 'package:notes_maker/database/DataBase.dart';
import 'package:provider/provider.dart';

//pages
import 'screen/notes_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: TextTheme(
                titleLarge: TextStyle(
                    fontFamily: 'Carlito',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                bodyLarge: TextStyle(fontFamily: 'Carlito', fontSize: 20),
                bodyMedium: TextStyle(fontFamily: 'Carlito', fontSize: 15),
                labelMedium: TextStyle(
                    fontFamily: 'Carlito',
                    fontWeight: FontWeight.normal,
                    fontSize: 15))),
        home: NotesPage(),
      ),
    );
  }
}
