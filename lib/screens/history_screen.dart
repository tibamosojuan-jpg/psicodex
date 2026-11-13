import 'package:flutter/material.dart';

import '../data/pokemon_data.dart';
import '../models/result_entry.dart';
import '../services/history_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/common.dart';
import '../widgets/pokemon_widgets.dart';
import 'result_screen.dart';

// historial de resultados
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<ResultEntry>> _future = HistoryService.load();

  Future<void> _clear() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('¿Borrar el historial?'),
        content: const Text('Se eliminarán todos tus resultados guardados.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Borrar')),
        ],
      ),
    );
    if (ok == true) {
      await HistoryService.clear();
      setState(() => _future = HistoryService.load());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ResultEntry>>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(color: AppColors.red));
        }
        final entries = snap.data ?? [];

        if (entries.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(logoAsset, width: 90),
                  const SizedBox(height: 16),
                  Text('Todavía no tienes resultados. ¡Haz tu primer test!',
                      textAlign: TextAlign.center, style: AppText.display(18)),
                  const SizedBox(height: 20),
                  PokeButton(label: 'Ir al test', onPressed: () => currentTab.value = 0),
                ],
              ),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Aquí se guardan tus resultados anteriores.',
                style: AppText.body(13, color: AppColors.textSecondary)),
            const SizedBox(height: 12),
            for (final e in entries) ...[
              _HistoryTile(entry: e),
              const SizedBox(height: 10),
            ],
            TextButton.icon(
              onPressed: _clear,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Borrar historial'),
            ),
          ],
        );
      },
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.entry});
  final ResultEntry entry;

  @override
  Widget build(BuildContext context) {
    final p = pokemonById(entry.pokemonId);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ResultScreen(entry: entry)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.screenLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PokemonImage(url: p.imageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.name, style: AppText.display(16)),
                    Text(p.title, style: AppText.body(13, color: AppColors.red)),
                    Text(formatDate(entry.date),
                        style: AppText.body(12, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
