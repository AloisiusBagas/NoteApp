import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/DefaultAppbar.dart';
import 'package:mynote_app/Constant/DefaultFAB.dart';
import 'package:mynote_app/Pages/Home/Component/DateTime.dart';
import 'package:mynote_app/Pages/Home/Component/NoteCollection.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _imgprovider = Provider.of<IMGPicker>(context);
    final _themechanger = Provider.of<ThemeProvider>(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
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
          children: [
            Time(),
            const NoteCollection(isarchived: true),
          ],
        ),
      ),
    );
  }
}
