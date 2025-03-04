import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    this.hintText = 'Search in Store',
    this.leadingIcon = Icons.search,
    this.trailingWidget,
    this.onTap,
    this.showBackground = true,
    this.showBorder = true,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    this.padding = const EdgeInsets.all(16.0),
    this.borderRadius = 8.0,
  })  : backgroundColor = backgroundColor ?? Colors.transparent,
        borderColor = borderColor ?? TColors.grey,
        textColor = textColor ?? TColors.grey;

  final String hintText;
  final IconData leadingIcon;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final bool showBackground;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Determine effective background color
    final effectiveBackgroundColor = showBackground
        ? (backgroundColor != Colors.transparent
        ? backgroundColor
        : (isDarkMode ? TColors.dark : TColors.light))
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: showBorder ? Border.all(color: borderColor) : null,
          ),
          child: Row(
            children: [
              Icon(leadingIcon, color: textColor),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  hintText,
                  style: TextStyle(color: textColor),
                ),
              ),
              if (trailingWidget != null) ...[
                const SizedBox(width: 8.0),
                trailingWidget!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
