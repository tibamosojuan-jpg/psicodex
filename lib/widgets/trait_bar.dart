import 'package:flutter/material.dart';

import '../models/trait.dart';
import '../theme/app_theme.dart';

// barra de cada rasgo con su porcentaje
class TraitBar extends StatelessWidget {
  const TraitBar({super.key, required this.trait, required this.percent});
  final Trait trait;
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(color: trait.color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(trait.label, style: AppText.body(13, weight: FontWeight.w700)),
              ),
              Text('$percent %', style: AppText.retro(9)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: percent / 100),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (_, value, __) => LinearProgressIndicator(
                value: value,
                minHeight: 8,
                backgroundColor: const Color(0xFFE5E7EB),
                valueColor: AlwaysStoppedAnimation(trait.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// las 5 barras
class TraitProfile extends StatelessWidget {
  const TraitProfile({super.key, required this.values});
  final Map<Trait, int> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (final t in Trait.values) TraitBar(trait: t, percent: values[t]!)],
    );
  }
}
