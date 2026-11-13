import 'trait.dart';

class ResultEntry {
  const ResultEntry({
    required this.pokemonId,
    required this.percents,
    required this.date,
  });

  final int pokemonId;
  final Map<Trait, int> percents;
  final DateTime date;

  Map<String, dynamic> toJson() => {
        'id': pokemonId,
        'date': date.toIso8601String(),
        'p': {for (final e in percents.entries) e.key.name: e.value},
      };

  factory ResultEntry.fromJson(Map<String, dynamic> json) {
    final p = json['p'] as Map;
    return ResultEntry(
      pokemonId: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      percents: {for (final t in Trait.values) t: (p[t.name] as num).toInt()},
    );
  }
}
