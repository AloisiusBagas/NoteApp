import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoubleBackExit extends StatefulWidget {
  const DoubleBackExit({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  _DoubleBackExitState createState() => _DoubleBackExitState(child: child);
}

class _DoubleBackExitState extends State<DoubleBackExit> {
  _DoubleBackExitState({
    required this.child,
  });

  DateTime? _currentBackPressTime;
  final Widget child;
  final int _durationSeconds = 2;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final now = DateTime.now();
        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) >
                Duration(seconds: _durationSeconds)) {
          setState(() {
            _currentBackPressTime = now;
          });
          Fluttertoast.showToast(
            msg: "Press back again to exit",
            backgroundColor: Colors.grey[400],
          );
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
      child: child,
    );
  }
}
