import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'pokedex_parts.dart';

// appbar roja con titulo y luces
class PokedexAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokedexAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.onClose,
  });

  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final VoidCallback? onClose;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.red,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Atrás',
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      titleSpacing: showBack ? 0 : 16,
      title: Text(title, style: AppText.display(19, color: Colors.white)),
      actions: [
        if (onClose != null)
          IconButton(icon: const Icon(Icons.close), tooltip: 'Salir del test', onPressed: onClose)
        else
          const Padding(padding: EdgeInsets.only(right: 16), child: PokedexLights()),
      ],
    );
  }
}
