import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/Theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider(this._themeData) {
    _isdarkmode = false;
    _state = 0;
  }

  ThemeData _themeData;
  late bool _isdarkmode;
  late int _state;

  bool get isdarkmode => _isdarkmode;
  int get gestate => _state;

  void setState(int state) {
    _state = state;
    notifyListeners();
  }

  ThemeData get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    if (_themeData == darktheme()) {
      _isdarkmode = true;
    } else if (_themeData == lighttheme()) {
      _isdarkmode = false;
    }
    notifyListeners();
  }
}
