import 'package:flutter/material.dart';

class Choice {
  Choice(this.text, this.colorlight, this.colordark);
  String text;
  Color colorlight;
  Color colordark;
}

List<Choice> listcolor = [
  Choice("White", Colors.white, Colors.white),
  Choice("Red", const Color(0xFFffe2e2), const Color(0xFFffcdcd)),
  Choice("Yellow", const Color(0xfffff7d1), const Color(0xFFfff2ab)),
  Choice("Green", const Color(0xFFe4f9e0), const Color(0xFFcbf1c4)),
  Choice("Blue", const Color(0xFFe2f1ff), const Color(0xFFcde9ff)),
];
