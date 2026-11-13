import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/pokedex_parts.dart';
import 'question_screen.dart';

// inicio del test
class TestStartScreen extends StatelessWidget {
  const TestStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        PokedexViewer(
          dark: true,
          height: 170,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Escáner listo.\nToca «Comenzar escaneo» para descubrir tu Pokémon.',
              textAlign: TextAlign.center,
              style: AppText.body(13, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text('¿Qué Pokémon eres?', style: AppText.display(26)),
        const SizedBox(height: 8),
        Text(
          'Responde 15 situaciones y la PsicoDex analizará tu personalidad con el modelo de los Cinco Grandes rasgos.',
          style: AppText.body(14, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            InfoChip(label: '15 preguntas'),
            InfoChip(label: '3 minutos'),
            InfoChip(label: '16 Pokémon'),
          ],
        ),
        const SizedBox(height: 16),
        const NoticeBox(
          text: 'Es un juego de autoconocimiento hecho para clase, no un diagnóstico psicológico.',
        ),
        const SizedBox(height: 32),
        PokeButton(
          label: 'Comenzar escaneo',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const QuestionScreen()),
          ),
        ),
      ],
    );
  }
}
