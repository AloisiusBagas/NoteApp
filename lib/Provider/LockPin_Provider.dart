import 'package:flutter/material.dart';

class LockPinProvider with ChangeNotifier {
  bool _pinone = false;
  bool _pintwo = false;
  bool _pinthree = false;
  bool _pinfour = false;
  List<String> currpin = ["", "", "", ""];

  void setPinone() {
    _pinone = !_pinone;
    notifyListeners();
  }

  void setPintwo() {
    _pintwo = !_pintwo;
    notifyListeners();
  }

  void setPinthree() {
    _pinthree = !_pinthree;
    notifyListeners();
  }

  void setPinfour() {
    _pinfour = !_pinfour;
    notifyListeners();
  }
}
