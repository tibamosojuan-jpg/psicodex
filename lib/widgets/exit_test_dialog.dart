import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import 'pokedex_parts.dart';

// dialogo para salir del test, devuelve true si le da a salir
class ExitTestDialog extends StatelessWidget {
  const ExitTestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PokedexLights(),
            const SizedBox(height: 12),
            Text('¿Salir del test?', style: AppText.display(20)),
            const SizedBox(height: 6),
            Text('Si sales ahora, perderás las respuestas que llevas.',
                style: AppText.body(14, color: AppColors.textSecondary)),
            const SizedBox(height: 18),
            PokeButton(
              label: 'Seguir respondiendo',
              onPressed: () => Navigator.of(context).pop(false),
            ),
            const SizedBox(height: 10),
            PokeButton(
              label: 'Salir',
              secondary: true,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ),
    );
  }
}
