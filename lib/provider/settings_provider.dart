import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentlocale = "en";
  ThemeMode CurrentThemeMode = ThemeMode.light;

  void setCurrentLocale(String newlocale) {
    currentlocale = newlocale;
    notifyListeners();
  }

  void setCurrentThemeMode(ThemeMode newthememode) {
    CurrentThemeMode = newthememode;
    notifyListeners();
  }

  bool isdarkmode() => CurrentThemeMode == ThemeMode.dark;
}
