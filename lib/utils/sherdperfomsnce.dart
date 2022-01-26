import 'package:local_notifaiction/localizition/type_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static getString(
    String key,
  ) async {
    SharedPreferences prfrance = await SharedPreferences.getInstance();
    var result = prfrance.getString(key);
    return result;
  }

  static setString(String key, value) async {
    SharedPreferences prfrance = await SharedPreferences.getInstance();
    var result = prfrance.setString(key, value);
    return result;
  }

  static getLanguageType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(LANGUAGEkEY); //
    print(data);
    // if (data == 'English') {
    //   return true;
    // } else {
    //   return false;
    // }
    return data;
  }
}
