import 'dart:math';

import '../data/pokemon_data.dart';
import '../models/pokemon_profile.dart';
import '../models/trait.dart';

// aqui se calcula el resultado del test
class Scorer {
  // pasa la suma de cada rasgo (de 3 a 12) a porcentaje
  static Map<Trait, int> toPercents(Map<Trait, int> sums) => {
        for (final t in Trait.values) t: (((sums[t]! - 3) / 9) * 100).round(),
      };

  // busca el pokemon que mas se parece a la persona
  static PokemonProfile match(Map<Trait, int> user, {Random? random}) {
    var best = 1 << 30;
    var tied = <PokemonProfile>[];

    for (final p in pokemonList) {
      var d = 0;
      for (final t in Trait.values) {
        final diff = p.profile[t]! - user[t]!;
        d += diff * diff;
      }
      if (d < best) {
        best = d;
        tied = [p];
      } else if (d == best) {
        tied.add(p);
      }
    }
    if (tied.length == 1) return tied.first;

    // si hay empate gana el que mas se parece en el rasgo mas alto
    final strongest = topTraits(user, 1).first;
    var bestDiff = 1 << 30;
    var tied2 = <PokemonProfile>[];
    for (final p in tied) {
      final diff = (p.profile[strongest]! - user[strongest]!).abs();
      if (diff < bestDiff) {
        bestDiff = diff;
        tied2 = [p];
      } else if (diff == bestDiff) {
        tied2.add(p);
      }
    }
    // si sigue el empate se escoge uno al azar
    return tied2[(random ?? Random()).nextInt(tied2.length)];
  }

  static List<Trait> topTraits(Map<Trait, int> values, [int n = 2]) {
    final list = Trait.values.toList()
      ..sort((a, b) => values[b]!.compareTo(values[a]!));
    return list.take(n).toList();
  }
}
