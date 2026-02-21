import 'package:mynote_app/DAO/Note_dao.dart';
import 'package:mynote_app/Model/NoteModel.dart';

class NoteService {
  const NoteService();
  final noteDao = const NoteDao();

  Future<List<NoteModel>> getAllNote() async {
    return noteDao.getAll(isarchived: 0);
  }

  Future<List<NoteModel>> getAllArchivedNote() async {
    return noteDao.getAll(isarchived: 1);
  }

  Future<bool> deleteNote(int id) async {
    final res = await noteDao.deleteNote(id);
    if (res > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future insertNote(NoteModel newNote) async {
    await noteDao.addNote(newNote);
  }

  Future addArchive(int id, int isarchived) async {
    await noteDao.addArchive(id, isarchived);
  }

  Future updateNote(NoteModel newNote) async {
    await noteDao.updateNote(newNote);
  }
}
