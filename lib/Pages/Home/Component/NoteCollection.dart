import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';
import 'package:mynote_app/Pages/Home/Component/ListAllNote.dart';
import 'package:mynote_app/Pages/Home/Component/SearchBox.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class NoteCollection extends StatelessWidget {
  const NoteCollection({
    Key? key,
    this.isarchived = false,
  }) : super(key: key);
  final bool isarchived;
  @override
  Widget build(BuildContext context) {
    final _themechanger = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(17.0, 15.0, 17.0, 0),
        decoration: BoxDecoration(
            color: _themechanger.isdarkmode == true ? darkGrey : Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                offset: const Offset(6.0, -4.0),
                blurRadius: 4.0,
              )
            ]),
        child: Column(
          children: [
            const SearchBox(),
            const SizedBox(height: 12),
            ListAllNote(isarchived: isarchived),
          ],
        ),
      ),
    );
  }
}
