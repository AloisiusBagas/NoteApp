import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mynote_app/Constant/Theme.dart';
import 'package:mynote_app/Helper/Disablelandscape.dart';
import 'package:mynote_app/Pages/Home/HomePage.dart';
import 'package:mynote_app/Provider/BGColor_provider.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

import 'Constant/Removescrollglow.dart';

void main(List<String> args) {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    disableLandscape();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(
            create: (context) => NoteProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(lighttheme())),
        ChangeNotifierProvider<BgColorprovider>(
            create: (context) => BgColorprovider()),
        ChangeNotifierProvider<IMGPicker>(create: (context) => IMGPicker()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: Removescrollglow(),
              child: child,
            );
          },
          theme: theme.getTheme,
          home: HomePage(),
        ),
      ),
    );
  }
}
