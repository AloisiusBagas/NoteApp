import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoubleBackExit extends StatefulWidget {
  const DoubleBackExit({
    @required this.child,
  });

  final Widget child;

  @override
  _DoubleBackExitState createState() => _DoubleBackExitState(child: child);
}

class _DoubleBackExitState extends State<DoubleBackExit> {
  _DoubleBackExitState({
    @required this.child,
  });

  DateTime _currentBackPressTime;
  final Widget child;
  final int _durationSeconds = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: child,
    );
  }

  Future<bool> _onWillPop() {
    final now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime) >
            Duration(
              seconds: _durationSeconds,
            )) {
      setState(() {
        _currentBackPressTime = now;
      });

      Fluttertoast.showToast(
        msg: "Press back again to exit",
        backgroundColor: Colors.grey[400],
      );
      return Future.value(false);
    }

    // Exit app
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }
}
