import 'package:shared_preferences/shared_preferences.dart';

String? colortext;

Future saveColor(String value) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("CurrentColor", value);
  colortext = value;
}

Future<String> getcurrentColor() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString("CurrentColor") ?? "White";
}
