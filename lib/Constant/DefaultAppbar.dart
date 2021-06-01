import 'package:flutter/material.dart';
import 'package:mynote_app/Pages/Home/Component/Rive.dart';
import 'package:mynote_app/Pages/Lock/Lockscreen.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

import 'ConstColor.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    Key key,
    @required ThemeProvider themechanger,
    this.title,
    this.isUseThemeMode,
    this.isUseArchive,
    this.iconData,
  })  : _themechanger = themechanger,
        super(key: key);

  final ThemeProvider _themechanger;
  final String title;
  final IconData iconData;
  final bool isUseThemeMode;
  final bool isUseArchive;

  @override
  Widget build(BuildContext context) {
    final _noteprovider = Provider.of<NoteProvider>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (iconData != null)
            Icon(
              iconData,
              size: 20,
            ),
          const SizedBox(width: 8),
          Text(title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 19,
                  color: _themechanger.isdarkmode == true
                      ? Colors.white
                      : orangeBGColor)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              if (isUseThemeMode)
                Riverslider(
                  themechanger: _themechanger,
                ),
              if (isUseArchive)
                IconButton(
                  color: _themechanger.isdarkmode == true
                      ? Colors.white
                      : Colors.grey,
                  splashColor: Colors.transparent,
                  tooltip: "Archive",
                  icon: const Icon(Icons.archive_rounded),
                  onPressed: () {
                    _noteprovider.filter = "";
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const LockScreen()));
                  },
                )
            ],
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
