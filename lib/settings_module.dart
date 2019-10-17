import 'dart:async';

import 'package:janastore/prefrences.dart';

class Settings{
  bool isArabic = false;

  Settings(){
    getLangPreference().then(updateLang);
  }

  void updateLang(bool current) {
    this.isArabic = current;
  }

}