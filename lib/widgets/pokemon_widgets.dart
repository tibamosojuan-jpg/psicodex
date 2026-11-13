import 'package:flutter/material.dart';

import '../models/pokemon_profile.dart';
import '../services/poke_api.dart';
import '../services/tcg_api.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'common.dart';

const logoAsset = 'assets/img/logo.png';

// imagen de internet, si falla muestra el logo local
class PokemonImage extends StatelessWidget {
  const PokemonImage({super.key, required this.url, this.size});
  final String url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : SizedBox(
              width: size,
              height: size,
              child: const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.red),
                ),
              ),
            ),
      errorBuilder: (context, error, stack) =>
          Image.asset(logoAsset, width: (size ?? 80) * 0.6, height: (size ?? 80) * 0.6),
    );
  }
}

// tarjeta de cada pokemon
class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon, required this.onTap});
  final PokemonProfile pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.screenLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: PokemonImage(url: pokemon.imageUrl),
                ),
              ),
              const SizedBox(height: 8),
              Text(pokemon.number, style: AppText.retro(8)),
              const SizedBox(height: 4),
              Text(pokemon.name, style: AppText.display(15)),
            ],
          ),
        ),
      ),
    );
  }
}

// muestra tipos, altura y peso de pokeapi
class PokeApiInfo extends StatefulWidget {
  const PokeApiInfo({super.key, required this.pokemonId, this.showSize = false});
  final int pokemonId;
  final bool showSize;

  @override
  State<PokeApiInfo> createState() => _PokeApiInfoState();
}

class _PokeApiInfoState extends State<PokeApiInfo> {
  late Future<PokeDetails> _future = PokeApi.fetch(widget.pokemonId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokeDetails>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.red),
            ),
          );
        }
        if (snap.hasError) {
          return Row(
            children: [
              const Icon(Icons.wifi_off, size: 18, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Expanded(
                child: Text('No se pudieron cargar los datos de PokeAPI.',
                    style: AppText.body(13, color: AppColors.textSecondary)),
              ),
              TextButton(
                onPressed: () => setState(() => _future = PokeApi.fetch(widget.pokemonId)),
                child: const Text('Reintentar'),
              ),
            ],
          );
        }
        final d = snap.data!;
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final t in d.types) InfoChip(label: widget.showSize ? t : 'Tipo $t'),
            if (widget.showSize) ...[
              InfoChip(label: '${d.heightM.toStringAsFixed(1)} m'),
              InfoChip(label: '${d.weightKg.toStringAsFixed(1)} kg'),
            ],
          ],
        );
      },
    );
  }
}

// muestra la carta de tcgdex
class TcgCardView extends StatefulWidget {
  const TcgCardView({super.key, required this.name});
  final String name;

  @override
  State<TcgCardView> createState() => _TcgCardViewState();
}

class _TcgCardViewState extends State<TcgCardView> {
  late final Future<String?> _future = TcgApi.cardImageUrl(widget.name);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.red)),
          );
        }
        final url = snap.data;
        if (url == null) {
          return Text('No se encontró una carta para ${widget.name}.',
              style: AppText.body(13, color: AppColors.textSecondary));
        }
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(url, height: 260, fit: BoxFit.contain),
          ),
        );
      },
    );
  }
}
