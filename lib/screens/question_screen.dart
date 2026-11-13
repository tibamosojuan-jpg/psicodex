import 'dart:math';

import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../models/trait.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/common.dart';
import '../widgets/exit_test_dialog.dart';
import '../widgets/pokedex_app_bar.dart';
import '../widgets/pokedex_parts.dart';
import 'scanning_screen.dart';

// pantalla de preguntas, no tiene barra de abajo
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _random = Random();

  // desordena las opciones de cada pregunta
  late final List<List<int>> _orders = [
    for (var i = 0; i < questions.length; i++) List<int>.generate(4, (j) => j)..shuffle(_random),
  ];

  // opcion que eligio en cada pregunta (null si no ha respondido)
  final List<int?> _selected = List<int?>.filled(questions.length, null);
  int _current = 0;

  bool get _isLast => _current == questions.length - 1;

  void _next() {
    if (_selected[_current] == null) return;
    if (!_isLast) {
      setState(() => _current++);
      return;
    }
    final sums = {for (final t in Trait.values) t: 0};
    for (var i = 0; i < questions.length; i++) {
      final q = questions[i];
      sums[q.trait] = sums[q.trait]! + q.pointsFor(_selected[i]!);
    }
    Navigator.of(context).pushReplacement(fadeRoute(ScanningScreen(sums: sums)));
  }

  void _back() {
    if (_current == 0) {
      Navigator.of(context).pop();
    } else {
      setState(() => _current--);
    }
  }

  Future<void> _confirmExit() async {
    final exit = await showDialog<bool>(
      context: context,
      builder: (_) => const ExitTestDialog(),
    );
    if (exit == true && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[_current];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PokedexAppBar(
        title: 'Pregunta ${_current + 1} de ${questions.length}',
        showBack: true,
        onBack: _back,
        onClose: _confirmExit,
      ),
      body: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(end: (_current + 1) / questions.length),
            duration: const Duration(milliseconds: 300),
            builder: (_, value, __) => LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: AppColors.redLight,
              valueColor: const AlwaysStoppedAnimation(AppColors.red),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: ListView(
                key: ValueKey(_current),
                padding: const EdgeInsets.all(16),
                children: [
                  PokedexViewer(
                    height: 130,
                    child: Text(
                      'SITUACIÓN ${(_current + 1).toString().padLeft(2, '0')}',
                      style: AppText.retro(11, color: AppColors.text),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(q.text, style: AppText.display(20)),
                  const SizedBox(height: 6),
                  Text('Elige la opción que más se parece a ti.',
                      style: AppText.body(13, color: AppColors.textSecondary)),
                  const SizedBox(height: 14),
                  for (final optionIndex in _orders[_current])
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnswerOption(
                        text: q.options[optionIndex],
                        selected: _selected[_current] == optionIndex,
                        onTap: () => setState(() => _selected[_current] = optionIndex),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: PokeButton(
                label: _isLast ? 'Ver resultado' : 'Siguiente',
                onPressed: _selected[_current] == null ? null : _next,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
