import 'package:shared_preferences/shared_preferences.dart';

//saving language data
Future<bool> saveNamePrefrence(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('appLang', name);
  return prefs.commit();
}

//getting language data
Future<String> getNamePrefrence() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String lang = prefs.getString('appLang');
  return lang;
}
