import 'dart:convert';

import 'package:http/http.dart' as http;

class PokeDetails {
  const PokeDetails({required this.types, required this.heightM, required this.weightKg});
  final List<String> types;
  final double heightM;
  final double weightKg;
}

// api 1: pokeapi, trae tipos, altura y peso
class PokeApi {
  static final Map<int, PokeDetails> _cache = {};

  static const _typesEs = {
    'normal': 'Normal', 'fire': 'Fuego', 'water': 'Agua', 'electric': 'Eléctrico',
    'grass': 'Planta', 'ice': 'Hielo', 'fighting': 'Lucha', 'poison': 'Veneno',
    'ground': 'Tierra', 'flying': 'Volador', 'psychic': 'Psíquico', 'bug': 'Bicho',
    'rock': 'Roca', 'ghost': 'Fantasma', 'dragon': 'Dragón', 'dark': 'Siniestro',
    'steel': 'Acero', 'fairy': 'Hada',
  };

  static Future<PokeDetails> fetch(int id) async {
    final cached = _cache[id];
    if (cached != null) return cached;

    final res = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'))
        .timeout(const Duration(seconds: 10));
    if (res.statusCode != 200) {
      throw Exception('PokeAPI respondió ${res.statusCode}');
    }
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final types = (data['types'] as List)
        .map((t) => t['type']['name'] as String)
        .map((t) => _typesEs[t] ?? t)
        .toList();

    final details = PokeDetails(
      types: types,
      heightM: (data['height'] as num) / 10, // viene en decimetros
      weightKg: (data['weight'] as num) / 10, // viene en hectogramos
    );
    _cache[id] = details;
    return details;
  }
}
