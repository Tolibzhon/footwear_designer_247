import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<List<String>> getPodcastList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('PodcastList') ?? [];
  }

  static Future<void> setPodcastList(List<String> count) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('PodcastList', count);
  }

  static Future<bool> getEmptyDes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('EmptyDes') ?? false;
  }

  static Future<void> setEmptyDes(bool emptyDes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('EmptyDes', emptyDes);
  }

  static Future<int> getPrem() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Prem') ?? 0;
  }

  static Future<void> setPrem(int prem) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Prem', prem);
  }
}
