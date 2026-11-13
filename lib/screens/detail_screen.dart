import 'package:flutter/material.dart';

import '../models/pokemon_profile.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/common.dart';
import '../widgets/pokedex_app_bar.dart';
import '../widgets/pokedex_nav_bar.dart';
import '../widgets/pokedex_parts.dart';
import '../widgets/pokemon_widgets.dart';
import '../widgets/trait_bar.dart';

// detalle del pokemon con datos de las dos apis
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.pokemon});
  final PokemonProfile pokemon;

  @override
  Widget build(BuildContext context) {
    final p = pokemon;
    return Scaffold(
      appBar: PokedexAppBar(title: p.name, showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PokedexViewer(height: 230, child: PokemonImage(url: p.imageUrl, size: 160)),
          const SizedBox(height: 12),
          Text(p.number, style: AppText.retro(10)),
          const SizedBox(height: 6),
          Text(p.title, style: AppText.display(24)),
          const SizedBox(height: 10),
          PokeApiInfo(pokemonId: p.id, showSize: true),
          const SizedBox(height: 10),
          Text(p.explanation, style: AppText.body(15, color: AppColors.textSecondary)),
          const SizedBox(height: 16),
          SectionCard(title: 'Perfil de personalidad', child: TraitProfile(values: p.profile)),
          const SizedBox(height: 12),
          SectionCard(title: 'Dato curioso', child: Text(p.funFact, style: AppText.body(14))),
          const SizedBox(height: 12),
          SectionCard(title: 'Su carta del juego de cartas', child: TcgCardView(name: p.name)),
          const SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: PokedexNavBar(
        currentIndex: 1,
        onTap: (i) => goToTab(context, i),
      ),
    );
  }
}
