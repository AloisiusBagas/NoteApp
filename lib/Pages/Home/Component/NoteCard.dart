import 'dart:convert';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Constant/NoteColor.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Pages/Alert.dart';
import 'package:mynote_app/Pages/Note/NotePage.dart';
import 'package:mynote_app/Provider/BGColor_provider.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key key, this.note}) : super(key: key);
  final NoteModel note;

  Widget getimage() {
    if (note.image != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.memory(base64Decode(note.image)));
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bgcolorprovider = Provider.of<BgColorprovider>(context);
    final _imgprovider = Provider.of<IMGPicker>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);
    final _noteprovider = Provider.of<NoteProvider>(context);

    Color searchcolor(String text) {
      for (final color in listcolor) {
        if (text == color.text) {
          if (_themechanger.isdarkmode == true) {
            return color.colordark;
          } else {
            return color.colorlight;
          }
        }
      }
      return Colors.white;
    }

    return FocusedMenuHolder(
        blurSize: 0.5,
        duration: const Duration(milliseconds: 300),
        menuWidth: MediaQuery.of(context).size.width / 2,
        onPressed: () {},
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
              title: const Text(
                "Open",
                style: TextStyle(color: Colors.black),
              ),
              trailingIcon: Icon(
                Icons.open_in_new,
                color: Colors.grey[400],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NotePage(
                          isedit: true,
                          notetemp: note,
                          bgcolorprovider: _bgcolorprovider,
                          imgprovider: _imgprovider,
                        )));
              }),
          FocusedMenuItem(
              title: const Text(
                "Info",
                style: TextStyle(color: Colors.black),
              ),
              trailingIcon: Icon(
                Icons.info,
                color: Colors.grey[400],
              ),
              onPressed: () {
                infoalert(
                    context, _themechanger, note.createdat, note.updateat);
              }),
          FocusedMenuItem(
              title: Text(
                note.isarchived == 0 ? "Archieve" : "Unarchieve",
                style: const TextStyle(color: Colors.black),
              ),
              trailingIcon: Icon(
                Icons.archive_rounded,
                color: Colors.grey[400],
              ),
              onPressed: () {
                _noteprovider.addArchieve(note.id, note.isarchived);
                Fluttertoast.showToast(
                    msg: note.isarchived == 0
                        ? "Note moved to archieve"
                        : "Note Unarchieve",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 12.0);
              }),
          FocusedMenuItem(
              title: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
              trailingIcon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              backgroundColor: const Color(0xFFF44336),
              onPressed: () {
                deletealert(context, _noteprovider, true, note.id);
              }),
        ],
        child: OpenContainer(
            closedElevation: 2,
            openColor: _themechanger.isdarkmode
                ? greyBGColor
                : searchcolor(note.colornote),
            closedColor: searchcolor(note.colornote),
            transitionDuration: const Duration(milliseconds: 600),
            closedBuilder: (context, openwidget) {
              return Card(
                elevation: 0,
                color: searchcolor(note.colornote),
                child: Column(
                  children: [
                    getimage(),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            note.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          if (note.title.isNotEmpty &&
                              note.note.isNotEmpty == true)
                            const SizedBox(height: 8),
                          if (note.note.isNotEmpty)
                            Text(
                              note.note,
                              maxLines: 13,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black),
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            openBuilder: (context, action) {
              return NotePage(
                isedit: true,
                notetemp: note,
                bgcolorprovider: _bgcolorprovider,
                imgprovider: _imgprovider,
                isarchive: note.isarchived == 0 ? false : true,
              );
            }));
  }
}
