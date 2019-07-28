import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DataUtils {

  static const String SP_COLOR_THEME_INDEX = "colorThemeIndex";


  static setColorTheme(int colorTheme) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(SP_COLOR_THEME_INDEX, colorTheme);
  }

  static Future<int> getColorTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  }
}