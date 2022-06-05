import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'notes_list.dart';

class DBHelper {
  Database db;
  var version = 1;
  String tableName = 'notesData';
  String id = 'id';
  String title = 'title';
  String note = 'note';
  String textFamily = 'textFamily';
  String color = 'color';
  String appBarColor = 'appBarColor';
  String dbName = 'NotesData.db';

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get database async {
    if (db == null) {
      return db = await openDatabase(
        join(await getDatabasesPath(), dbName),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, $title TEXT,$note TEXT, $textFamily TEXT, $color TEXT, $appBarColor TEXT)");
        },
        version: version,
      );
    } else {
      return db;
    }
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    Database database = await instance.database;
    try {
      database.insert(tableName, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {}
  }

  Future<List<NotesList>> getAllData() async {
    Database database = await instance.database;
    final List<Map<String, dynamic>> data = await database.query(tableName);
    return List.generate(data.length, (index) {
      return NotesList(
          noteID: data[index][id],
          title: data[index][title],
          note: data[index][note],
          color: data[index][color],
          textFamily: data[index][textFamily],
          appBarColor: data[index][appBarColor]);
    });
  }

  Future<void> delete(int noteID) async {
    Database database = await instance.database;
    await database.delete(tableName, where: '$id = ?', whereArgs: [noteID]);
  }

  Future<void> deleteAll() async {
    Database database = await instance.database;
    await database.delete(tableName);
  }

  Future<void> update(Map<String, dynamic> data, int noteID) async {
    Database database = await instance.database;
    await database
        .update(tableName, data, where: '$id = ?', whereArgs: [noteID]);
  }
}
