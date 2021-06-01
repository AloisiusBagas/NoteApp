import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Helper/HideKeybordonPop.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Pages/Note/Component/BottomNavbar.dart';
import 'package:mynote_app/Pages/Note/Component/ImagePage.dart';
import 'package:mynote_app/Pages/Note/Component/PickColor.dart';
import 'package:mynote_app/Pages/Note/Component/SaveButton.dart';
import 'package:mynote_app/Provider/BGColor_provider.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage(
      {Key key,
      this.isedit = false,
      this.notetemp,
      this.bgcolorprovider,
      this.imgprovider,
      this.isarchive = false})
      : super(key: key);

  final bool isedit;
  final bool isarchive;
  final NoteModel notetemp;
  final BgColorprovider bgcolorprovider;
  final IMGPicker imgprovider;

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  String imgpath;
  @override
  void initState() {
    if (widget.isedit == true) {
      widget.imgprovider.setimgpath = widget.notetemp.image;
      titlecontroller.text = widget.notetemp.title;
      notecontroller.text = widget.notetemp.note;
      widget.bgcolorprovider.searchcolor(widget.notetemp.colornote);
      widget.bgcolorprovider.setcoloredittext = widget.notetemp.colornote;
    }
    super.initState();
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    notecontroller.dispose();
    widget.imgprovider.resetimage();
    imgpath = null;
    super.dispose();
  }

  void deleteimage() {
    setState(() {
      widget.imgprovider.resetimage();
      imgpath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _bgcolorprovider = Provider.of<BgColorprovider>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);
    final _imgpicker = Provider.of<IMGPicker>(context);
    imgpath = _imgpicker.imgpath;
    return Scaffold(
      backgroundColor: _themechanger.isdarkmode == true
          ? greyBGColor
          : widget.isedit == true
              ? _bgcolorprovider.bgcoloredit
              : _bgcolorprovider.bgcoloradd,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              FocusScope.of(context).unfocus();
            }),
        backgroundColor: _themechanger.isdarkmode == true
            ? darkGrey
            : widget.isedit == true
                ? _bgcolorprovider.appbarcoloredit
                : _bgcolorprovider.appbarcoloradd,
        actions: [
          PickColor(
            bgColorprovider: _bgcolorprovider,
          ),
          SaveBTN(
            isarchive: widget.isarchive,
            isedit: widget.isedit,
            notetemp: widget.notetemp,
            titlecontroller: titlecontroller,
            notecontroller: notecontroller,
            imgpath: imgpath,
            bgcolorprovider: _bgcolorprovider,
          )
        ],
      ),
      body: HideKeyboardonPop(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: titlecontroller,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          border: InputBorder.none,
                        ),
                      ),
                      if (imgpath != null)
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Imagepage(
                                        imgpath: imgpath,
                                        deleteimage: deleteimage,
                                      )));
                            },
                            child: Image.memory(base64Decode(imgpath)))
                      else
                        Container(),
                      TextField(
                        controller: notecontroller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          hintText: "Input Text Here",
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(widget.isedit == true
                  ? "Edited at : ${widget.notetemp.updateat}"
                  : DateFormat.yMd().add_jm().format(DateTime.now())),
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(
        isedit: widget.isedit,
        notetemp: widget.notetemp,
      ),
    );
  }
}
