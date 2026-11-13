import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

// boton rojo o boton con borde
class PokeButton extends StatelessWidget {
  const PokeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.secondary = false,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool secondary;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
        Text(label, style: GoogleFonts.fredoka(fontSize: 16, fontWeight: FontWeight.w600)),
      ],
    );

    final button = secondary
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.red,
              side: const BorderSide(color: AppColors.red, width: 1.5),
              shape: const StadiumBorder(),
            ),
            child: content,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color(0xFFEFA3B0),
              disabledForegroundColor: Colors.white,
              elevation: 0,
              shape: const StadiumBorder(),
            ),
            child: content,
          );

    final enabled = onPressed != null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: enabled && !secondary
            ? const [BoxShadow(color: AppColors.redDark, offset: Offset(0, 4))]
            : null,
      ),
      child: SizedBox(width: double.infinity, height: 56, child: button),
    );
  }
}

// opcion de respuesta
class AnswerOption extends StatelessWidget {
  const AnswerOption({super.key, required this.text, required this.selected, required this.onTap});

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        constraints: const BoxConstraints(minHeight: 56),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppColors.redLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.red : AppColors.border,
            width: selected ? 2 : 1.2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: selected ? AppColors.red : AppColors.textSecondary,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: AppText.body(15))),
          ],
        ),
      ),
    );
  }
}

// cuadro amarillo de aviso
class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warnBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 18, color: AppColors.text),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppText.body(13))),
        ],
      ),
    );
  }
}

// etiqueta roja
class InfoChip extends StatelessWidget {
  const InfoChip({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.redLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: AppText.body(12, color: AppColors.red, weight: FontWeight.w800)),
    );
  }
}

// tarjeta blanca
class SectionCard extends StatelessWidget {
  const SectionCard({super.key, this.title, required this.child});
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 10, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: AppText.display(16)),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }
}
