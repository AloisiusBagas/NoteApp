import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/Theme.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:mynote_app/SharedPreferences/Theme.dart';
import 'package:provider/provider.dart';

class Riverslider extends StatefulWidget {
  final ThemeProvider themechanger;

  const Riverslider({Key key, this.themechanger}) : super(key: key);
  @override
  _RiversliderState createState() => _RiversliderState();
}

class _RiversliderState extends State<Riverslider> {
  // 0 = night
  // 1 = night -> day
  // 2 = day
  // 3 = day -> night

  @override
  void initState() {
    super.initState();
    getcurrentheme().then((value) {
      widget.themechanger.setState(value);
      //state = value;
      if (widget.themechanger.gestate == 0) {
        widget.themechanger.setTheme(darktheme());
      } else {
        widget.themechanger.setTheme(lighttheme());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themechanger = Provider.of<ThemeProvider>(context);
    return Row(
      children: <Widget>[
        Text(
          (_themechanger.gestate == 3 || _themechanger.gestate == 0)
              ? "Dark\nMode"
              : "Light\nMode",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10,
              color: (_themechanger.gestate == 3 || _themechanger.gestate == 0)
                  ? Colors.white
                  : Colors.grey[700],
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 48,
          height: 40,
          child: GestureDetector(
            onTap: () {
              if (_themechanger.gestate == 0) {
                savetheme(1);
                _themechanger.setState(1);
                _themechanger.setTheme(lighttheme());
              } else if (_themechanger.gestate == 2) {
                savetheme(3);
                _themechanger.setState(3);
                _themechanger.setTheme(darktheme());
              }
            },
            child: FlareActor(
              "assets/Rive/switch_daytime.flr",
              animation: (_themechanger.gestate == 0)
                  ? "night_idle"
                  : (_themechanger.gestate == 1)
                      ? "switch_day"
                      : (_themechanger.gestate == 2)
                          ? "day_idle"
                          : "switch_night",
              callback: (animationname) {
                if (animationname == "switch_day") {
                  _themechanger.setState(2);
                  savetheme(2);
                } else if (animationname == "switch_night") {
                  _themechanger.setState(0);
                  savetheme(0);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
