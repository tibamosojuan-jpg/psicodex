import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// lente azul
class PokedexLens extends StatelessWidget {
  const PokedexLens({super.key, this.size = 56});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.08),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: AppColors.shell, width: size * 0.06),
        boxShadow: [
          BoxShadow(color: AppColors.lightBlue.withAlpha(110), blurRadius: size * 0.3),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: Alignment(-0.3, -0.4),
            colors: [Color(0xFF7CC8FF), AppColors.lightBlue, Color(0xFF1477C9)],
            stops: [0, 0.55, 1],
          ),
        ),
        child: Align(
          alignment: const Alignment(-0.35, -0.45),
          child: Container(
            width: size * 0.28,
            height: size * 0.16,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(200),
              borderRadius: BorderRadius.circular(size),
            ),
          ),
        ),
      ),
    );
  }
}

// las 3 lucecitas
class PokedexLights extends StatelessWidget {
  const PokedexLights({super.key, this.size = 10});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final c in const [AppColors.lightBlue, AppColors.lightYellow, AppColors.lightGreen])
          Container(
            margin: EdgeInsets.only(left: size * 0.5),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
      ],
    );
  }
}

// visor de la pokedex, puede ser claro u oscuro
class PokedexViewer extends StatelessWidget {
  const PokedexViewer({super.key, required this.child, this.dark = false, this.height = 180});
  final Widget child;
  final bool dark;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.bezel,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
          ),
          Positioned(
            top: 7,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (_) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 30,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: dark ? AppColors.screenDark : AppColors.screenLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: child),
            ),
          ),
          Positioned(
            left: 14,
            bottom: 8,
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 10,
            child: Column(
              children: List.generate(
                3,
                (_) => Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 22,
                  height: 2,
                  color: AppColors.shell,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
