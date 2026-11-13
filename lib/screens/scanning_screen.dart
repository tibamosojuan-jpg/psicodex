import 'dart:async';

import 'package:flutter/material.dart';

import '../logic/scorer.dart';
import '../models/result_entry.dart';
import '../models/trait.dart';
import '../services/history_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/pokedex_parts.dart';
import 'result_screen.dart';

// pantalla de carga, calcula el resultado y lo guarda
class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key, required this.sums});
  final Map<Trait, int> sums;

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> with TickerProviderStateMixin {
  late final AnimationController _progress =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2500))..forward();
  late final AnimationController _pulse =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 700))
        ..repeat(reverse: true);
  Timer? _timer;
  int _step = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) setState(() => _step = (_step + 1) % Trait.values.length);
    });
    _finish();
  }

  Future<void> _finish() async {
    final percents = Scorer.toPercents(widget.sums);
    final pokemon = Scorer.match(percents);
    final entry = ResultEntry(pokemonId: pokemon.id, percents: percents, date: DateTime.now());

    await Future.wait([
      HistoryService.add(entry),
      Future.delayed(const Duration(milliseconds: 2500)),
    ]);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(fadeRoute(ResultScreen(entry: entry)));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progress.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = Trait.values[_step];
    return Scaffold(
      backgroundColor: AppColors.screenDark,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: Tween(begin: 0.92, end: 1.08).animate(
                CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
              ),
              child: const PokedexLens(size: 110),
            ),
            const SizedBox(height: 28),
            Text('ESCANEANDO...', style: AppText.retro(12, color: Colors.white)),
            const SizedBox(height: 12),
            Text('Analizando tu personalidad', style: AppText.display(17, color: Colors.white)),
            const SizedBox(height: 16),
            SizedBox(
              width: 190,
              child: AnimatedBuilder(
                animation: _progress,
                builder: (_, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _progress.value,
                    minHeight: 6,
                    backgroundColor: const Color(0xFF3A4654),
                    valueColor: const AlwaysStoppedAnimation(AppColors.lightBlue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final t in Trait.values)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: t == current ? 12 : 8,
                    height: t == current ? 12 : 8,
                    decoration: BoxDecoration(color: t.color, shape: BoxShape.circle),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Midiendo ${current.label.toLowerCase()}...',
                style: AppText.body(12, color: const Color(0xFF9AA5B1))),
          ],
        ),
      ),
    );
  }
}
