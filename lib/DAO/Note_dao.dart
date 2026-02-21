import 'package:mynote_app/Database/database.dart';
import 'package:mynote_app/Model/DatabaseHelper.dart';
import 'package:mynote_app/Model/NoteModel.dart';

class NoteDao {
  const NoteDao();

  Future<List<NoteModel>> getAll({int? isarchived}) async {
    final _db = await DBManager.getinstance();
    final list = await _db.rawQuery(
        "SELECT * FROM ${DatabaseHelper.tablename} WHERE ${DatabaseHelper.columnIsarchive} == $isarchived  ORDER BY ${DatabaseHelper.columnSortdate} DESC");
    final List<NoteModel> note = [];
    for (final data in list) {
      final temp = NoteModel(
          data[DatabaseHelper.columnTitle].toString(),
          data[DatabaseHelper.columnNote].toString(),
          data[DatabaseHelper.columnPhoto].toString(),
          data[DatabaseHelper.columnCreatedat].toString(),
          data[DatabaseHelper.columnUpdateat].toString(),
          data[DatabaseHelper.columnSortdate].toString(),
          data[DatabaseHelper.columnNoteColor].toString());
      temp.setNote(int.parse(data[DatabaseHelper.columnId].toString()));
      temp.setIsArchived(
          int.parse(data[DatabaseHelper.columnIsarchive].toString()));
      note.add(temp);
    }
    return note;
  }

  Future<int> addNote(NoteModel newNote) async {
    final _db = await DBManager.getinstance();
    final res = await _db.insert(DatabaseHelper.tablename, newNote.toMap());
    return res;
  }

  Future<int> addArchive(int id, int isarchived) async {
    final _db = await DBManager.getinstance();
    if (isarchived == 0) {
      final res = await _db.rawUpdate(
          'UPDATE ${DatabaseHelper.tablename} SET ${DatabaseHelper.columnIsarchive} = 1 WHERE id = $id');
      return res;
    } else {
      final res = await _db.rawUpdate(
          'UPDATE ${DatabaseHelper.tablename} SET ${DatabaseHelper.columnIsarchive} = 0 WHERE id = $id');
      return res;
    }
  }

  Future<int> updateNote(NoteModel newNote) async {
    final _db = await DBManager.getinstance();
    final res = await _db.update(DatabaseHelper.tablename, newNote.toMap(),
        where: '${DatabaseHelper.columnId} = ?', whereArgs: [newNote.id]);
    return res;
  }

  Future<int> deleteNote(int id) async {
    final _db = await DBManager.getinstance();
    final res = await _db.delete(DatabaseHelper.tablename,
        where: '${DatabaseHelper.columnId} = ?', whereArgs: [id]);
    return res;
  }
}
