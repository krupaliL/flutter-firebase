import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  // static const String IS_LIGHT_MODE = "isLightMode";
  static const String IS_DARK_MODE = "isDarkMode";
  static const String SELECTED_LANGUAGE = "selectedLanguage";
}

class PreferencesUtils {
  static Future<void> saveBool({required String key, required bool value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static Future<bool> getBool({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.get(key);
    if (data != null) {
      return data as bool;
    } else {
      return false;
    }
  }

  static Future<void> saveString({required String key, required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String> getString({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.get(key);
    if (data != null) {
      return data as String;
    } else {
      return "";
    }
  }

  static Future<void> saveInt({required String key, required int value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  static Future<int> getInt({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.get(key);
    if (data != null) {
      return data as int;
    } else {
      return -1;
    }
  }

  static Future<void> remove({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  static Future<void> clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  static Future<void> saveUint8List({required String key, required Uint8List value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String base64String = base64Encode(value);
    preferences.setString(key, base64String);
  }

  static Future<Uint8List?> getUint8List({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? base64String = preferences.getString(key);
    if (base64String != null) {
      return base64Decode(base64String);
    }
    return null;
  }
}
