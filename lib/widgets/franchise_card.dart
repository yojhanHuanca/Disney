import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/theme.dart';

class FranchiseCard extends StatefulWidget {
  const FranchiseCard({
    super.key,
    required this.franchise,
    required this.selected,
    required this.onTap,
  });

  final Map<String, String> franchise;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<FranchiseCard> createState() => _FranchiseCardState();
}

class _FranchiseCardState extends State<FranchiseCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      child: AnimatedScale(
        // Animación de escala al presionar o seleccionar una franquicia.
        scale: _pressed ? 0.94 : (widget.selected ? 1.03 : 1),
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        child: SizedBox(
          width: 154,
          child: Card(
            elevation: widget.selected ? 10 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              side: BorderSide(
                color: widget.selected
                    ? const Color(0xFF4A9BFF)
                    : Colors.white.withValues(alpha: 0.18),
                width: widget.selected ? 2 : 1,
              ),
            ),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF263A59), Color(0xFF151925)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    widget.franchise['asset']!,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Text(
                      widget.franchise['name']!,
                      textAlign: TextAlign.center,
                      style: AppTheme.label.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
