import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PsicoDexApp());
}

class PsicoDexApp extends StatelessWidget {
  const PsicoDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PsicoDex',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // en web se ve del ancho de un celular
      builder: (context, child) => ColoredBox(
        color: const Color(0xFF2B2B33),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: child,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
