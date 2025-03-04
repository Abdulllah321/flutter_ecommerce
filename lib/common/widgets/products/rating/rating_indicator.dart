import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class TRatingIndicator extends StatelessWidget {
  final double rating;
  final double itemSize;
  final Color ratedColor;
  final Color unratedColor;

  const TRatingIndicator({
    super.key,
    required this.rating,
    this.itemSize = 20,
    this.ratedColor = TColors.primary,
    this.unratedColor = TColors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: unratedColor,
      itemBuilder: (_, __) => Icon(
        Iconsax.star1,
        color: ratedColor,
      ),
    );
  }
}
