import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/NoteColor.dart';
import 'package:mynote_app/Provider/BGColor_provider.dart';
import 'package:mynote_app/SharedPreferences/NoteColor.dart';
import 'package:provider/provider.dart';

class PickColor extends StatefulWidget {
  const PickColor({
    Key? key,
    this.bgColorprovider,
  }) : super(key: key);

  final BgColorprovider? bgColorprovider;

  @override
  _PickColorState createState() => _PickColorState();
}

class _PickColorState extends State<PickColor> {
  @override
  void initState() {
    super.initState();
    getcurrentColor()
        .then((value) => widget.bgColorprovider?.getsavecolor(value));
  }

  @override
  Widget build(BuildContext context) {
    final _bgcolorprovider = Provider.of<BgColorprovider>(context);
    return PopupMenuButton<Choice>(
        tooltip: "Change Color",
        icon: const Icon(Icons.color_lens),
        onSelected: (Choice value) {
          _bgcolorprovider.changecolor(value);
          _bgcolorprovider.changecoloredittext = value;
        },
        itemBuilder: (BuildContext context) {
          return listcolor.map((Choice e) {
            return PopupMenuItem<Choice>(
              value: e,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 15,
                    height: 15,
                    color: e.colorlight,
                  ),
                  const SizedBox(width: 10),
                  Text(e.text)
                ],
              ),
            );
          }).toList();
        });
  }
}
