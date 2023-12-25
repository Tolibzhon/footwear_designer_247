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
}
