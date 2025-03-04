import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.color,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TSizes.sm,
  });

  final String title;
  final Color? color;
  final int maxLines;
  final TextAlign textAlign;
  final double brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: _getTextStyle(context).apply(color: color),
    );
  }

  /// Returns text style based on the given `brandTextSize`
  TextStyle _getTextStyle(BuildContext context) {
    if (brandTextSize == TSizes.sm) {
      return Theme.of(context).textTheme.labelMedium!;
    } else if (brandTextSize == TSizes.md) {
      return Theme.of(context).textTheme.bodyLarge!;
    } else if (brandTextSize == TSizes.lg) {
      return Theme.of(context).textTheme.titleLarge!;
    }
    return Theme.of(context).textTheme.bodyMedium!;
  }
}
