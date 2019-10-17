import 'package:shared_preferences/shared_preferences.dart';

//saving language data
Future<bool> saveLangPreference(bool name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('appLang', name);
}

//getting language data
Future<bool> getLangPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool lang = prefs.getBool('appLang') == null ? false : prefs.getBool('appLang');
  return lang;
}
