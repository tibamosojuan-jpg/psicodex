import 'package:flutter/material.dart';

import '../data/pokemon_data.dart';
import '../logic/scorer.dart';
import '../models/result_entry.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/common.dart';
import '../widgets/pokedex_app_bar.dart';
import '../widgets/pokedex_nav_bar.dart';
import '../widgets/pokedex_parts.dart';
import '../widgets/pokemon_widgets.dart';
import '../widgets/trait_bar.dart';
import 'detail_screen.dart';
import 'question_screen.dart';

// pantalla del resultado
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.entry});
  final ResultEntry entry;

  @override
  Widget build(BuildContext context) {
    final p = pokemonById(entry.pokemonId);
    final top = Scorer.topTraits(entry.percents);

    return Scaffold(
      appBar: const PokedexAppBar(title: 'Tu resultado', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PokedexViewer(height: 230, child: PokemonImage(url: p.imageUrl, size: 160)),
          const SizedBox(height: 12),
          Text(p.number, style: AppText.retro(10)),
          const SizedBox(height: 6),
          Text('¡Eres ${p.name}!', style: AppText.display(28)),
          const SizedBox(height: 2),
          Text(p.title, style: AppText.display(16, color: AppColors.red)),
          const SizedBox(height: 10),
          PokeApiInfo(pokemonId: p.id),
          const SizedBox(height: 10),
          Text(p.explanation, style: AppText.body(15)),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Tus rasgos más marcados',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final t in top) InfoChip(label: '${t.label} ${entry.percents[t]} %'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(title: 'Tu perfil completo', child: TraitProfile(values: entry.percents)),
          const SizedBox(height: 12),
          SectionCard(title: 'Dato curioso', child: Text(p.funFact, style: AppText.body(14))),
          const SizedBox(height: 12),
          const NoticeBox(
            text: 'PsicoDex es un juego de autoconocimiento. No reemplaza una evaluación psicológica profesional.',
          ),
          const SizedBox(height: 20),
          PokeButton(
            label: 'Ver en la Pokédex',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetailScreen(pokemon: p)),
            ),
          ),
          const SizedBox(height: 10),
          PokeButton(
            label: 'Repetir test',
            secondary: true,
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const QuestionScreen()),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: PokedexNavBar(
        currentIndex: 0,
        onTap: (i) => goToTab(context, i),
      ),
    );
  }
}
