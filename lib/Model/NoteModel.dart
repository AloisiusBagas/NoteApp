class NoteModel {
  NoteModel(
    this._title,
    this._note,
    this._photoname,
    this._createdat,
    this._updateat,
    this._sortdate,
    this._colornote,
  );
  int? _id;
  int? _isarchived;
  final String _title;
  final String _note;
  final String? _photoname;
  final String _createdat;
  final String _updateat;
  final String _sortdate;
  final String _colornote;

  //getter
  int get id => _id ?? 0;
  int get isarchived => _isarchived ?? 0;
  String get title => _title;
  String get note => _note;
  String? get image => _photoname;
  String get createdat => _createdat;
  String get updateat => _updateat;
  String get sortdate => _sortdate;
  String get colornote => _colornote;

  //insert data to database
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['note'] = _note;
    map['photoname'] = _photoname;
    map['createdat'] = _createdat;
    map['updateat'] = _updateat;
    map['sortdate'] = _sortdate;
    map['colornote'] = _colornote;
    map['isarchive'] = isarchived;

    return map;
  }

  void setNote(int id) {
    _id = id;
  }

  void setIsArchived(int flag) {
    _isarchived = flag;
  }
}
