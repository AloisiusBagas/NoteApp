import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';

TextTheme basetextTheme(TextTheme base) {
  return base.copyWith(
    titleLarge: base.bodyMedium!.copyWith(fontFamily: 'Montserrat Bold'),
    bodyMedium: base.bodyMedium!.copyWith(fontFamily: 'Montserrat SemiBold'),
    headlineMedium:
        base.displaySmall!.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    titleMedium: base.titleMedium!
        .copyWith(fontSize: 15.5, fontWeight: FontWeight.normal),
    bodySmall:
        base.bodySmall!.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
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
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.white, elevation: 0));
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
          backgroundColor: darkGrey,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)));
}
