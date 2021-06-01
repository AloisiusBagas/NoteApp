import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Provider/BGColor_provider.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class SaveBTN extends StatelessWidget {
  const SaveBTN({
    Key key,
    @required this.titlecontroller,
    @required this.notecontroller,
    @required BgColorprovider bgcolorprovider,
    this.imgpath,
    this.notetemp,
    this.isedit,
    this.isarchive,
  })  : _bgcolorprovider = bgcolorprovider,
        super(key: key);

  final bool isedit;
  final bool isarchive;
  final NoteModel notetemp;
  final TextEditingController titlecontroller;
  final TextEditingController notecontroller;
  final String imgpath;
  final BgColorprovider _bgcolorprovider;

  bool ischange() {
    return (titlecontroller.text != notetemp.title) ||
        (notecontroller.text != notetemp.note) ||
        (imgpath != notetemp.image) ||
        (_bgcolorprovider.coloredittext != notetemp.colornote);
  }

  bool isempty() {
    return (titlecontroller.text == "") &&
        (notecontroller.text == "") &&
        (imgpath == null);
  }

  @override
  Widget build(BuildContext context) {
    final _themechanger = Provider.of<ThemeProvider>(context);
    final _noteprovider = Provider.of<NoteProvider>(context);

    return GestureDetector(
      onTap: () {
        if (isedit == true && ischange() && isempty() == false) {
          _noteprovider.updateNote(
              int.parse(notetemp.id.toString()),
              notetemp.createdat.toString(),
              titlecontroller.text,
              notecontroller.text,
              imgpath,
              _bgcolorprovider.coloredittext,
              isarchive);
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Note updated successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 12.0);
        } else if (isedit == false && isempty() == false) {
          _noteprovider.insertNote(titlecontroller.text, notecontroller.text,
              imgpath, _bgcolorprovider.bgcolortext, isarchive);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          Fluttertoast.showToast(
              msg: "Note added successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 12.0);
        } else {
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 26, top: 12, bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
              color: _themechanger.isdarkmode == true
                  ? Colors.white
                  : Theme.of(context).primaryColor),
        ),
        child: Text(
          "Save",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: _themechanger.isdarkmode == true
                  ? Colors.white
                  : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
