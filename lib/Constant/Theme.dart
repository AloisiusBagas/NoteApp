import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';

TextTheme basetextTheme(TextTheme base) {
  return base.copyWith(
    headline6: base.bodyText1.copyWith(fontFamily: 'Montserrat Bold'),
    bodyText1: base.bodyText1.copyWith(fontFamily: 'Montserrat SemiBold'),
    headline2:
        base.headline1.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    subtitle1:
        base.subtitle1.copyWith(fontSize: 15.5, fontWeight: FontWeight.normal),
    subtitle2:
        base.subtitle2.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
  );
}

ThemeData lighttheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: orangeBGColor,
      primaryIconTheme: const IconThemeData(color: orangeBGColor),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: orangeBGColor),
      hintColor: Colors.grey[350],
      textTheme:
          basetextTheme(base.textTheme).apply(displayColor: Colors.grey[800]),
      scaffoldBackgroundColor: orangeBGColor,
      appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0));
}

ThemeData darktheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      primaryColor: greyBGColor,
      primaryIconTheme: const IconThemeData(color: greyBGColor),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: darkFloatBTN),
      hintColor: Colors.white60,
      textTheme:
          basetextTheme(base.textTheme).apply(displayColor: Colors.white),
      iconTheme: const IconThemeData(color: Color(0xFFE2E2E2)),
      scaffoldBackgroundColor: greyBGColor,
      appBarTheme: const AppBarTheme(
          color: darkGrey,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)));
}
