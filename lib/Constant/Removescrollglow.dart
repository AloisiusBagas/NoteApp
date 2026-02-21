import 'package:flutter/material.dart';

// Flutter 3.x: override buildOverscrollIndicator instead of buildViewportChrome
class Removescrollglow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
