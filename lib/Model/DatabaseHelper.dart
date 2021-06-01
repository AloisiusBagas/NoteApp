class DatabaseHelper {
  const DatabaseHelper();

  static const String tablename = 'MyNote';
  static const int dbversion = 1;
  static const String dbname = 'noteDatabase.db';

  static const String columnTitle = 'title';
  static const String columnId = 'id';
  static const String columnNote = 'note';
  static const String columnPhoto = 'photoname';
  static const String columnCreatedat = 'createdat';
  static const String columnUpdateat = 'updateat';
  static const String columnSortdate = 'sortdate';
  static const String columnNoteColor = 'colornote';
  static const String columnIsarchive = 'isarchive';
}
