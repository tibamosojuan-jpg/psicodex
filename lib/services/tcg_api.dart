import 'dart:convert';

import 'package:http/http.dart' as http;

// api 2: tcgdex, trae la carta del pokemon (no necesita key)
class TcgApi {
  static final Map<String, String?> _cache = {};

  static Future<String?> cardImageUrl(String name) async {
    if (_cache.containsKey(name)) return _cache[name];

    String? url;
    for (final lang in ['es', 'en']) {
      try {
        final uri = Uri.https('api.tcgdex.net', '/v2/$lang/cards', {'name': name});
        final res = await http.get(uri).timeout(const Duration(seconds: 10));
        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          if (data is List) {
            for (final card in data) {
              final img = card['image'];
              if (img is String && img.isNotEmpty) {
                url = '$img/low.png';
                break;
              }
            }
          }
        }
      } catch (_) {
        // si falla probamos con el otro idioma
      }
      if (url != null) break;
    }
    _cache[name] = url;
    return url;
  }
}
