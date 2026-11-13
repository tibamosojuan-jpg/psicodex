import 'package:flutter/material.dart';

import '../models/trait.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/pokemon_widgets.dart';

// info del big five y creditos
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(child: Image.asset(logoAsset, width: 80)),
        const SizedBox(height: 16),
        SectionCard(
          title: '¿Qué es el Big Five?',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Es el modelo de personalidad más usado en psicología. Describe a cada persona con cinco rasgos que van de bajo a alto. Ningún extremo es malo.',
                style: AppText.body(14),
              ),
              const SizedBox(height: 12),
              for (final t in Trait.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: t.color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: '${t.label}: ',
                              style: AppText.body(14, weight: FontWeight.w800),
                            ),
                            TextSpan(text: t.description, style: AppText.body(14)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const NoticeBox(
          text: 'PsicoDex es un juego de autoconocimiento hecho para clase. No reemplaza una evaluación psicológica profesional.',
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Créditos',
          child: Text(
            'Proyecto académico de Multimedia para móviles, Universidad de San Buenaventura, Bogotá.\n\n'
            'Datos e imágenes: PokeAPI. Cartas: TCGdex.\n\n'
            'Pokémon y sus nombres son marcas de Nintendo, Game Freak y Creatures. Uso académico sin fines comerciales.',
            style: AppText.body(13),
          ),
        ),
      ],
    );
  }
}
