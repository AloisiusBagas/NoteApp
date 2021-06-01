import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/DefaultAppbar.dart';
import 'package:mynote_app/Constant/DefaultFAB.dart';
import 'package:mynote_app/Helper/DoubleBackExit.dart';
import 'package:mynote_app/Helper/KeyboardHider.dart';
import 'package:mynote_app/Pages/Home/Component/DateTime.dart';
import 'package:mynote_app/Pages/Home/Component/NoteCollection.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IMGPicker imgPicker = IMGPicker();

  @override
  Widget build(BuildContext context) {
    final _imgprovider = Provider.of<IMGPicker>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);
    return Scaffold(
        floatingActionButton: DefaultFAB(
          imgprovider: _imgprovider,
          isArchived: false,
        ),
        appBar: DefaultAppbar(
          themechanger: _themechanger,
          title: "MyNoteApp",
          isUseThemeMode: true,
          isUseArchive: true,
        ),
        body: DoubleBackExit(
          child: KeyboardHider(
            child: Column(
              children: [
                Time(),
                const NoteCollection(),
              ],
            ),
          ),
        ));
  }
}
