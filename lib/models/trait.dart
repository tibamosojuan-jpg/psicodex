import 'package:flutter/material.dart';

// los 5 rasgos del big five con su color
enum Trait {
  ex('Extroversión', 'energía social, gusto por la gente y la acción', Color(0xFFF59E0B)),
  ap('Apertura', 'curiosidad, imaginación, gusto por lo nuevo', Color(0xFF8B5CF6)),
  re('Responsabilidad', 'orden, planificación, constancia', Color(0xFF2563EB)),
  am('Amabilidad', 'empatía, cooperación, calidez', Color(0xFF16A34A)),
  es('Estabilidad emocional', 'calma ante la presión', Color(0xFF0D9488));

  const Trait(this.label, this.description, this.color);
  final String label;
  final String description;
  final Color color;
}
