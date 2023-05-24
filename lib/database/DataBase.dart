import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'DataBase.g.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().named('description')();
  IntColumn get category => integer().nullable()();
  IntColumn get priority => integer().nullable()();
  IntColumn get color => integer().nullable()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbfolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbfolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Note])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  //get all the notes
  Future<List<NoteData>> getAllNotes() async {
    return await select(note).get();
  }

  Future<int> insertNote(NoteCompanion noteCompanion) async {
    return await into(note).insert(noteCompanion);
  }
}
