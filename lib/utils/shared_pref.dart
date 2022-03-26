import 'package:shared_preferences/shared_preferences.dart';

class simple{
  static SharedPreferences ?preferences;
  static Future init() async => preferences = await SharedPreferences.getInstance();

}