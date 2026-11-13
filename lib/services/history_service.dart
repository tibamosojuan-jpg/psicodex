import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/result_entry.dart';

// guarda los resultados en el celular
class HistoryService {
  static const _key = 'psicodex_history';

  static Future<List<ResultEntry>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    final list = <ResultEntry>[];
    for (final item in raw) {
      try {
        list.add(ResultEntry.fromJson(jsonDecode(item) as Map<String, dynamic>));
      } catch (_) {}
    }
    list.sort((a, b) => b.date.compareTo(a.date)); // los mas nuevos primero
    return list;
  }

  static Future<void> add(ResultEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    raw.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_key, raw);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
