import 'package:flutter/material.dart';

// pestaña actual: 0 test, 1 pokedex, 2 historial, 3 info
final ValueNotifier<int> currentTab = ValueNotifier<int>(0);

// cambia de pestaña y vuelve a la pantalla principal
void goToTab(BuildContext context, int index) {
  currentTab.value = index;
  Navigator.of(context).popUntil((route) => route.isFirst);
}

// transicion tipo fade
Route<T> fadeRoute<T>(Widget page) => PageRouteBuilder<T>(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
    );

String formatDate(DateTime d) {
  const months = ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'];
  final hh = d.hour.toString().padLeft(2, '0');
  final mm = d.minute.toString().padLeft(2, '0');
  return '${d.day} ${months[d.month - 1]} ${d.year} · $hh:$mm';
}
