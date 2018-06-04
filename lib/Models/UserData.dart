import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import "Manifest.dart";
import 'Streak.dart';

class UserData {
  static List<Streak> _streaks;
  static Manifest _manifest = Manifest.fromJson({});

  static Future<Null> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map manifestMap = json.decode(prefs.getString("manifest") ?? "{}");
    _manifest = Manifest.fromJson(manifestMap);
    _streaks = List.generate(_manifest.keys.length, (index) {
      Map streakMap =
          json.decode(prefs.getString(_manifest.keys[index]) ?? "{}");
      return Streak.fromJson(streakMap);
    });
  }

  static List<Streak> getStreaks() {
    return _streaks;
  }

  static Future<Null> add(Streak streak) async {
    _streaks.add(streak);
    _manifest.keys.add(streak.id);
    await _saveStreak(streak);
    await _saveManifest(_manifest);
  }

  static Future<Null> remove(Streak streak) async {
    _streaks.removeWhere((s) => s.id == streak.id);
    _manifest.keys.remove(streak.id);
    await _removeStreak(streak);
    await _saveManifest(_manifest);
  }

  static Future<Null> update(Streak streak) async {
    int index = _streaks.indexWhere((s) => s.id == streak.id);
    if (index >= 0 && index < _streaks.length) {
      _streaks[index] = streak;
      await _saveStreak(streak);
      await _saveManifest(_manifest);
    }
  }

  static void _removeStreak(Streak streak) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(streak.id, null);
  }

  static void _saveStreak(Streak streak) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(streak.id, json.encode(streak.toJson()));
  }

  static void _saveManifest(Manifest manifest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("manifest", json.encode(manifest.toJson()));
  }
}
