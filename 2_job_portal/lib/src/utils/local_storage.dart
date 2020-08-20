import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorableDataType {
  String,
  BOOL,
  DOUBLE,
  INT,
  STRINGLIST,
}

class LocalStorage {
  static Future<bool> storeDataToLocal({@required String key, @required dynamic value, @required StorableDataType type}) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    try {
      switch (type) {
        case StorableDataType.String:
          return await _sharedPreferences.setString(key, value);
          break;
        case StorableDataType.BOOL:
          return await _sharedPreferences.setBool(key, value);
          break;
        case StorableDataType.INT:
          return await _sharedPreferences.setInt(key, value);
          break;
        case StorableDataType.DOUBLE:
          return await _sharedPreferences.setDouble(key, value);
          break;
        case StorableDataType.STRINGLIST:
          return await _sharedPreferences.setStringList(key, value);
          break;
        default:
          return false;
      }
    } catch (e) {
      return false;
    }
  }

  static dynamic getDataInLocal({@required String key, @required StorableDataType type}) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    try {
      switch (type) {
        case StorableDataType.String:
          return _sharedPreferences.getString(key);
          break;
        case StorableDataType.BOOL:
          return _sharedPreferences.getBool(key);
          break;
        case StorableDataType.INT:
          return _sharedPreferences.getInt(key);
          break;
        case StorableDataType.DOUBLE:
          return _sharedPreferences.getDouble(key);
          break;
        case StorableDataType.STRINGLIST:
          return _sharedPreferences.getStringList(key);
          break;
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }
}
