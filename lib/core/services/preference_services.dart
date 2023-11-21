import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefKeys {

  static String accessToken = "accessToken";


}

class Preference {
  static late SharedPreferences sb;
  static Future<void> init() async {
    sb = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    try {
      return sb.getString(key);
    } catch (e) {
      return null;
    }
  }

  static List<String>? getStringList(String key) {
    try {
      return sb.getStringList(key);
    } catch (e) {
      return null;
    }
  }



  static int? getInt(String key) {
    try {
      return sb.getInt(key);
    } catch (e) {
      return null;
    }
  }

  static bool? getBool(String key) {
    try {
      return sb.getBool(key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> setString(String key, String value) async {
    try {
      return await sb.setString(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> setStringList(String key, List<String> value) async {
    try {
      return await sb.setStringList(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> setInt(String key, int value) async {
    try {
      return sb.setInt(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> setBool(String key, bool value) async {
    try {
      return await sb.setBool(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> remove(String key) async {
    try {
      return await sb.remove(key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool?> clear() async {
    try {
      return await sb.clear();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Map<String,dynamic> getSavedObject(String key)  {
    try {
      if (sb.getString(key) != null) {
        var json = jsonDecode(sb.getString(key)!);
        return json ;
      }

      return {};

    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
