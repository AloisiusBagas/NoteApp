import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/NoteColor.dart';
import 'package:mynote_app/SharedPreferences/NoteColor.dart';

class BgColorprovider with ChangeNotifier {
  //add
  Color _bgColoradd = Colors.white;
  Color _appbarColoradd = Colors.white;
  String _colourtext = '';

  //edit
  Color _bgcoloredit = Colors.white;
  Color _appbarcoloredit = Colors.white;
  String _coloredittext = '';

  Color get bgcoloradd => _bgColoradd;
  Color get appbarcoloradd => _appbarColoradd;
  String get bgcolortext => _colourtext;

  Color get bgcoloredit => _bgcoloredit;
  Color get appbarcoloredit => _appbarcoloredit;
  String get coloredittext => _coloredittext;

  set setcolortext(String color) => _colourtext = color;
  set setcoloredittext(String color) => _coloredittext = color;
  set changecoloredittext(Choice c) => _coloredittext = c.text;

  void changecolor(Choice c) {
    _bgColoradd = c.colorlight;
    _appbarColoradd = c.colordark;
    _bgcoloredit = c.colorlight;
    _appbarcoloredit = c.colordark;
    _colourtext = c.text;
    saveColor(c.text);
    notifyListeners();
  }

  void searchcolor(String text) {
    for (final color in listcolor) {
      if (text == color.text) {
        _bgcoloredit = color.colorlight;
        _appbarcoloredit = color.colordark;
        break;
      }
    }
  }

  void getsavecolor(String text) {
    for (final color in listcolor) {
      if (text == color.text) {
        _bgColoradd = color.colorlight;
        _appbarColoradd = color.colordark;
        _colourtext = color.text;
        break;
      }
    }
    notifyListeners();
  }
}
