import 'package:shared_preferences/shared_preferences.dart';

Future savetheme(int value) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setInt("CurrentTheme", value);
}

Future<int> getcurrentheme() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt("CurrentTheme") ?? 2;
}
