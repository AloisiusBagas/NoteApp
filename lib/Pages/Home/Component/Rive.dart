import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/Theme.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:mynote_app/SharedPreferences/Theme.dart';
import 'package:provider/provider.dart';

class Riverslider extends StatefulWidget {
  final ThemeProvider? themechanger;

  const Riverslider({Key? key, this.themechanger}) : super(key: key);
  @override
  _RiversliderState createState() => _RiversliderState();
}

class _RiversliderState extends State<Riverslider> {
  // 0 = night / 1 = night->day / 2 = day / 3 = day->night

  @override
  void initState() {
    super.initState();
    getcurrentheme().then((value) {
      widget.themechanger?.setState(value);
      if (widget.themechanger?.gestate == 0) {
        widget.themechanger?.setTheme(darktheme());
      } else {
        widget.themechanger?.setTheme(lighttheme());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themechanger = Provider.of<ThemeProvider>(context);
    final bool isDark =
        _themechanger.gestate == 3 || _themechanger.gestate == 0;
    return Row(
      children: <Widget>[
        Text(
          isDark ? "Dark\nMode" : "Light\nMode",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Switch(
            value: !isDark,
            activeThumbColor: Colors.orange,
            onChanged: (val) {
              if (!isDark) {
                // switch to dark
                savetheme(3);
                _themechanger.setState(3);
                _themechanger.setTheme(darktheme());
                Future.delayed(const Duration(milliseconds: 100), () {
                  _themechanger.setState(0);
                  savetheme(0);
                });
              } else {
                // switch to light
                savetheme(1);
                _themechanger.setState(1);
                _themechanger.setTheme(lighttheme());
                Future.delayed(const Duration(milliseconds: 100), () {
                  _themechanger.setState(2);
                  savetheme(2);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
