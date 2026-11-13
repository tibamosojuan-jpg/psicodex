import 'trait.dart';

class PokemonProfile {
  const PokemonProfile({
    required this.id,
    required this.name,
    required this.title,
    required this.explanation,
    required this.funFact,
    required this.profile,
  });

  final int id;
  final String name;
  final String title;
  final String explanation;
  final String funFact;
  final Map<Trait, int> profile;

  // imagen oficial del repo de sprites de pokeapi
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  String get number => 'Nº ${id.toString().padLeft(3, '0')}';
}
