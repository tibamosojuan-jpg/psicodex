import 'package:flutter/material.dart';

import '../utils/app_state.dart';
import '../widgets/pokedex_app_bar.dart';
import '../widgets/pokedex_nav_bar.dart';
import 'history_screen.dart';
import 'info_screen.dart';
import 'pokedex_screen.dart';
import 'test_start_screen.dart';

// pantalla principal con appbar y barra de abajo
class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  static const _titles = ['PsicoDex', 'Pokédex', 'Mis resultados', 'Info'];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentTab,
      builder: (context, index, _) {
        final Widget body = switch (index) {
          0 => const TestStartScreen(),
          1 => const PokedexScreen(),
          2 => const HistoryScreen(),
          _ => const InfoScreen(),
        };
        return Scaffold(
          appBar: PokedexAppBar(title: _titles[index]),
          body: body,
          bottomNavigationBar: PokedexNavBar(
            currentIndex: index,
            onTap: (i) => currentTab.value = i,
          ),
        );
      },
    );
  }
}
