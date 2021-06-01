import 'package:flutter/material.dart';

class HideKeyboardonPop extends StatelessWidget {
  final Widget child;

  const HideKeyboardonPop({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: child,
    );
  }
}
