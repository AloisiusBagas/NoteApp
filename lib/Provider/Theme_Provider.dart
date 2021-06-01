import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/Theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider(this._themeData);
  bool get isdarkmode => _isdarkmode;

  ThemeData _themeData;
  bool _isdarkmode;
  int _state;

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
