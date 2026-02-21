import 'package:flutter/material.dart';

class HideKeyboardonPop extends StatelessWidget {
  final Widget? child;

  const HideKeyboardonPop({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        FocusScope.of(context).unfocus();
      },
      child: child ?? const SizedBox.shrink(),
    );
  }
}
