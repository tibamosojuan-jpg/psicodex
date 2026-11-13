import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/app_state.dart';
import '../widgets/pokedex_parts.dart';
import '../widgets/pokemon_widgets.dart';
import 'home_shell.dart';

// pantalla de carga inicial, dura 2 segundos
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.of(context).pushReplacement(fadeRoute(const HomeShell()));
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  PokedexLens(size: 64),
                  SizedBox(width: 8),
                  PokedexLights(size: 12),
                ],
              ),
            ),
            Container(height: 6, color: AppColors.redDark),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(logoAsset, width: 110),
                    const SizedBox(height: 16),
                    Text('PsicoDex', style: AppText.display(36, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('¿Qué Pokémon eres?', style: AppText.body(15, color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ENCENDIENDO...', style: AppText.retro(10, color: Colors.white)),
                  const SizedBox(height: 10),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: _controller.value,
                        minHeight: 8,
                        backgroundColor: AppColors.redDark,
                        valueColor: const AlwaysStoppedAnimation(AppColors.lightYellow),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
