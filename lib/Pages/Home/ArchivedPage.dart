import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/DefaultAppbar.dart';
import 'package:mynote_app/Constant/DefaultFAB.dart';
import 'package:mynote_app/Pages/Home/Component/DateTime.dart';
import 'package:mynote_app/Pages/Home/Component/NoteCollection.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class ArchivedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imgprovider = Provider.of<IMGPicker>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);
    Future<bool> onbackpress() {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onbackpress,
      child: Scaffold(
        appBar: DefaultAppbar(
          themechanger: _themechanger,
          title: "Archived",
          iconData: Icons.lock_rounded,
          isUseThemeMode: true,
          isUseArchive: false,
        ),
        floatingActionButton: DefaultFAB(
          imgprovider: _imgprovider,
          isArchived: true,
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(top: topPadding, bottom: 24),
            //   child: const Text("Archived"),
            // ),
            Time(),
            const NoteCollection(isarchived: true),
          ],
        ),
      ),
    );
  }
}
