import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFF1A1A2E); // Dark background
  static const primary = Color(0xFFFF00FF); // Neon Pink
  static const secondary = Color(0xFF00FFFF); // Cyan
  static const surface = Color(0xFF16213E); // Dark surface
  static const danger = Color(0xFFFF2A2A); // Bright Red
  static const darkText = Color(0xFF00FF41); // Terminal Green
  static const deepTeal = Color(0xFFE94560); // Neon Pink/Redish
  static const greenTeal = Color(0xFF00FFFF); // Cyan
  static const lightBorder = Color(0xFFFF00FF); // Pink
  static const loadingBackground = Color(0xFF1A1A2E);
  static const neonGreen = Color(0xFF39FF14);
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.placeholder,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    super.key,
  });

  final String placeholder;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      placeholder: placeholder,
      placeholderStyle: const TextStyle(color: AppColors.darkText),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Icon(icon, color: AppColors.primary),
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.lightBorder),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 14),
    this.padding = const EdgeInsets.all(16),
    this.border,
    this.shadow = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxBorder? border;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: border ?? Border.all(color: AppColors.lightBorder.withOpacity(0.3)),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
