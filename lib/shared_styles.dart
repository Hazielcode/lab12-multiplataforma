import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  static const background = Color(0xFFF0F0D8);
  static const primary = Color(0xFF007878);
  static const secondary = Color(0xFFA8C030);
  static const surface = Color(0xFFFFFDC0);
  static const danger = Color(0xFFCA221F);
  static const darkText = Color(0xFF184848);
  static const deepTeal = Color(0xFF006060);
  static const greenTeal = Color(0xFF00755C);
  static const lightBorder = Color(0xFFB9D7A1);
  static const loadingBackground = Color(0xFF002E34);
  static const neonGreen = Color(0xFF90FF17);
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
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: CupertinoColors.transparent),
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
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
        border: border,
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: CupertinoColors.black.withValues(alpha: 0.06),
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
