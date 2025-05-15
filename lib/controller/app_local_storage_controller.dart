import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageController {

  static Future<SharedPreferences> getSharedPreferencesObject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> setSharedPreferencesInt({required String key,required int number}) async {
    await getSharedPreferencesObject().then((value) async {
      await value.setInt(key, number);
    });
  }

  static Future<void> setSharedPreferencesBool({required String key,required bool boolValue}) async {
    await getSharedPreferencesObject().then((value) async {
      await value.setBool(key, boolValue);
    });
  }

  static Future<void> setSharedPreferencesDouble({required String key,required double doubleValue}) async {
    await getSharedPreferencesObject().then((value) async {
      await value.setDouble(key, doubleValue);
    });
  }

  static Future<void> setSharedPreferencesString({required String key,required String stringValue}) async {
    await getSharedPreferencesObject().then((value) async {
      await value.setString(key, stringValue);
    });
  }


  static Future<int?> getSharedPreferencesInt({required String key}) async {
    int? number;
    await getSharedPreferencesObject().then((value) async {
      number = value.getInt(key);
    });
    return number;
  }

  static Future<bool?> getSharedPreferencesBool({required String key}) async {
    bool? boolValue;
    await getSharedPreferencesObject().then((value) async {
      boolValue = value.getBool(key);
    });
    return boolValue;
  }

  static Future<double?> getSharedPreferencesDouble({required String key}) async {
    double? doubleValue;
    await getSharedPreferencesObject().then((value) async {
      doubleValue = value.getDouble(key);
    });
    return doubleValue;
  }

  static Future<String?> getSharedPreferencesString({required String key}) async {
    String? stringValue;
    await getSharedPreferencesObject().then((value) async {
      stringValue = value.getString(key);
    });
    return stringValue;
  }



  static Future<void> getSharedPreferencesRemove({required String key}) async {
    await getSharedPreferencesObject().then((value) async {
      await value.remove(key);
    });
  }






}