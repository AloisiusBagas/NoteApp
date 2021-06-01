import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/NoteColor.dart';
import 'package:mynote_app/SharedPreferences/NoteColor.dart';

class BgColorprovider with ChangeNotifier {
  //add
  Color _bgColoradd;
  Color _appbarColoradd;
  String _colourtext;

  //edit
  Color _bgcoloredit;
  Color _appbarcoloredit;
  String _coloredittext;

  Color get bgcoloradd => _bgColoradd;
  Color get appbarcoloradd => _appbarColoradd;
  String get bgcolortext => _colourtext;

  Color get bgcoloredit => _bgcoloredit;
  Color get appbarcoloredit => _appbarcoloredit;
  String get coloredittext => _coloredittext;

  set setcolortext(String color) => _colourtext = color;
  //buat di notepagenya pas mau update warna
  set setcoloredittext(String color) => _coloredittext = color;
  //buat di pick color
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

//search bgcolor when edit
  void searchcolor(String text) {
    for (final color in listcolor) {
      if (text == color.text) {
        _bgcoloredit = color.colorlight;
        _appbarcoloredit = color.colordark;
        break;
      }
    }
  }

//get color from shared preferences
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
