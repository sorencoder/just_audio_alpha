import 'package:flutter/material.dart';
import 'package:music/themes/dark_mode.dart';
import 'package:music/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initially light mode
  ThemeData _themeData = lightmode;

  // get theme
  ThemeData get themedata => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themedata(ThemeData themeData) {
    _themeData = themedata;

    //update UI
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightmode) {
      themedata = darkMode;
    } else {
      themedata = lightmode;
    }
  }
}
