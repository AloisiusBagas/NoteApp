import 'package:shared_preferences/shared_preferences.dart';

String? archivedPin;

Future savePin(String value) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("CurrentPin", value);
  archivedPin = value;
}

Future<String> getcurrentPin() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString("CurrentPin") ?? "";
}
