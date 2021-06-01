import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class PinNumber extends StatelessWidget {
  const PinNumber({
    Key key,
    @required this.pinCircleradius,
    @required this.isActive,
  }) : super(key: key);

  final double pinCircleradius;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final _themechanger = Provider.of<ThemeProvider>(context);

    Color colorisactive() {
      if (isActive) {
        if (_themechanger.isdarkmode) {
          return Colors.white;
        } else {
          return orangeBGColor;
        }
      } else {
        return Colors.transparent;
      }
    }

    return Container(
      width: pinCircleradius,
      height: pinCircleradius,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorisactive(),
          border: Border.all(
              width: 1.5,
              color: _themechanger.isdarkmode ? Colors.white : orangeBGColor)),
    );
  }
}
