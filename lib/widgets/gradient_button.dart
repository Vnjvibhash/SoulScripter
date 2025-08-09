import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final List<Color> gradientColors;
  final Widget? icon;
  final double fontSize;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool showShadow;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradientColors,
    this.icon,
    this.fontSize = 16.5,
    this.textStyle,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 27, vertical: 14),
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: gradientColors.first.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:
                  textStyle ??
                  const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            if (icon != null) ...[const SizedBox(width: 9), icon!],
          ],
        ),
      ),
    );
  }
}
