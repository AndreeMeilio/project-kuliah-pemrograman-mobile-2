import 'package:shared_preferences/shared_preferences.dart';

class CorePreferences {
  static final SharedPreferencesAsync _async = SharedPreferencesAsync();

  static Future<void> set<T>(String key, T value) async{
    if (T == bool){
      await _async.setBool(key, value as bool);
    } else if (T == String){
      await _async.setString(key, value as String);
    } else if (T == double){
      await _async.setDouble(key, value as double);
    } else if (T == int){
      await _async.setInt(key, value as int);
    } else if (T == List<String>){
      await _async.setStringList(key, value as List<String>);
    }
  }

  static Future<Object?> get<T>(String key) async{
    Object? result;

    if (T == bool){
      result = await _async.getBool(key);
    } else if (T == String){
      result = await _async.getString(key);
    } else if (T == double){
      result = await _async.getDouble(key);
    } else if (T == int){
      result = await _async.getInt(key);
    } else if (T == List<String>){
      result = await _async.getStringList(key);
    }

    return result as T?;
  }

  static Future<void> remove(String key) async{
    await _async.remove(key);
  }
}