import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Pages/Alert.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';
import 'package:mynote_app/Pages/Note/Component/NoteButton.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({
    Key? key,
    this.isedit,
    this.notetemp,
  }) : super(key: key);

  final bool? isedit;
  final NoteModel? notetemp;

  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    final _noteprovider = Provider.of<NoteProvider>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);
    final _imgpicker = Provider.of<IMGPicker>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      color: Colors.amber,
      child: Row(
        children: [
          NoteBTN(
            isedit: widget.isedit ?? false,
            color: Colors.red,
            icon: Icons.delete,
            text: "delete",
            onpress: () {
              deletealert(
                  context, _noteprovider, false, widget.notetemp?.id ?? 0);
            },
          ),
          NoteBTN(
            color: orangeBGColor,
            isedit: true,
            icon: Icons.add_photo_alternate,
            text: "Add Image",
            onpress: () {
              pickImagealert(context, _themechanger, _imgpicker);
            },
          ),
        ],
      ),
    );
  }
}
