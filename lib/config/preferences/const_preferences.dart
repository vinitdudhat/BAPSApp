


import 'package:shared_preferences/shared_preferences.dart';

class ConstPreference{

  void clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}