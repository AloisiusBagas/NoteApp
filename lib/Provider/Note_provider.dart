import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Service/Noteservice.dart';

class NoteProvider with ChangeNotifier {
  final NoteService _noteService = const NoteService();
  Future<List<NoteModel>> listallnote;

  String _filter = "";
  String get filter => _filter;

  set filter(String text) {
    _filter = text;
    notifyListeners();
  }

  Future<List<NoteModel>> getAllNote() async {
    return _noteService.getAllNote();
  }

  Future<List<NoteModel>> getArchivedNote() async {
    return _noteService.getAllArchivedNote();
  }

  Future<bool> deleteNote(int id) async {
    final res = await _noteService.deleteNote(id);
    if (res) {
      notifyListeners();
    }
    return res;
  }

  Future addArchieve(int id, int isarchived) async {
    await _noteService.addArchive(id, isarchived);
    notifyListeners();
  }

  Future insertNote(String title, String note, String photoname,
      String colornote, bool isarchive) async {
    final now = DateTime.now();
    final String datenow = DateFormat.yMd().add_jm().format(now);
    final newnote = NoteModel(
        title, note, photoname, datenow, datenow, now.toString(), colornote);
    if (isarchive) {
      newnote.setIsArchived(1);
    } else {
      newnote.setIsArchived(0);
    }
    if (title.isNotEmpty || note.isNotEmpty || photoname != null) {
      await _noteService.insertNote(newnote);
    }
    notifyListeners();
  }

  Future updateNote(int id, String createdat, String title, String note,
      String photoname, String colornote, bool isarchive) async {
    final now = DateTime.now();
    final String datenow = DateFormat.yMd().add_jm().format(now);
    final newnote = NoteModel(
        title, note, photoname, createdat, datenow, now.toString(), colornote);
    newnote.setNote(id);
    if (isarchive) {
      newnote.setIsArchived(1);
    } else {
      newnote.setIsArchived(0);
    }
    if (title.isNotEmpty || note.isNotEmpty || photoname != null) {
      await _noteService.updateNote(newnote);
    }

    notifyListeners();
  }
}
