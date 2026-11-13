import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

// barra de abajo, la pestaña activa sale en rojo
class PokedexNavBar extends StatelessWidget {
  const PokedexNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (Icons.center_focus_strong, 'Test'),
    (Icons.grid_view_rounded, 'Pokédex'),
    (Icons.history, 'Historial'),
    (Icons.info_outline, 'Info'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.shell,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xFF9A9BA6),
      selectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 12),
      unselectedLabelStyle: GoogleFonts.nunito(fontSize: 12),
      items: [
        for (final item in _items)
          BottomNavigationBarItem(
            label: item.$2,
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Icon(item.$1),
            ),
            activeIcon: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(item.$1, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
