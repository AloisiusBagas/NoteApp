import 'dart:io' as io;
import 'package:mynote_app/Model/DatabaseHelper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  factory DBManager() => _instance;
  DBManager.internal();

  static final DBManager _instance = DBManager.internal();

  static Database _db;

  static Future<Database> getinstance() async {
    if (_db != null) return _db;
    final io.Directory directory = await getApplicationSupportDirectory();
    final String path = join(directory.path, DatabaseHelper.dbname);
    return _db = await openDatabase(
      path,
      version: DatabaseHelper.dbversion,
      onCreate: (db, version) {
        return db.execute(createTableQuery);
      },
    );
  }

  static String createTableQuery = '''
      CREATE TABLE ${DatabaseHelper.tablename}(
      ${DatabaseHelper.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
      ${DatabaseHelper.columnTitle} TEXT, 
      ${DatabaseHelper.columnNote} TEXT,
      ${DatabaseHelper.columnPhoto} TEXT,
      ${DatabaseHelper.columnCreatedat} TEXT,
      ${DatabaseHelper.columnUpdateat} TEXT,
      ${DatabaseHelper.columnSortdate} TEXT,
      ${DatabaseHelper.columnNoteColor} TEXT,
      ${DatabaseHelper.columnIsarchive} INTEGER DEFAULT 0)
      ''';
}
