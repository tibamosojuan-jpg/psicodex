import 'dart:math';

import 'package:flutter/material.dart';

import '../data/pokemon_data.dart';
import '../models/pokemon_profile.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/pokemon_widgets.dart';
import 'detail_screen.dart';

// pokedex con buscador y boton aleatorio
class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final _random = Random();
  String _query = '';

  void _open(PokemonProfile p) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(pokemon: p)));
  }

  void _openRandom() => _open(pokemonList[_random.nextInt(pokemonList.length)]);

  @override
  Widget build(BuildContext context) {
    final list = pokemonList
        .where((p) => p.name.toLowerCase().contains(_query.trim().toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
          child: TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Buscar Pokémon',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PokeButton(
            label: 'Pokémon aleatorio',
            icon: Icons.casino_outlined,
            secondary: true,
            onPressed: _openRandom,
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? Center(
                  child: Text('Ningún Pokémon coincide con «$_query».',
                      style: AppText.body(14, color: AppColors.textSecondary)),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: list.length,
                  itemBuilder: (_, i) => PokemonCard(pokemon: list[i], onTap: () => _open(list[i])),
                ),
        ),
      ],
    );
  }
}
