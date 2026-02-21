import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    Key? key,
    this.onpress,
    this.number,
    this.radius,
    this.text,
    this.icon,
  }) : super(key: key);
  final double? radius;
  final int? number;
  final String? text;
  final Icon? icon;
  final Function? onpress;

  @override
  Widget build(BuildContext context) {
    final _themechanger = Provider.of<ThemeProvider>(context);
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _themechanger.isdarkmode ? darkmaterialBTN : Colors.white,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        highlightColor: _themechanger.isdarkmode ? Colors.grey : orangeBGColor,
        height: radius,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 50)),
        onPressed: onpress != null ? () => onpress!() : null,
        child: icon != null
            ? icon
            : number != null
                ? Text(
                    "$number",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:
                            _themechanger.isdarkmode ? Colors.white : darkGrey),
                  )
                : FittedBox(
                    child: Text(text ?? '',
                        style: TextStyle(
                            color: _themechanger.isdarkmode
                                ? Colors.white
                                : darkGrey)),
                  ),
      ),
    );
  }
}
