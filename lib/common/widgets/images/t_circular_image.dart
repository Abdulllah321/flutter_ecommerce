import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/shimmmer_effect.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });

  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width;
  final double height;
  final double padding;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDarkMode ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                placeholder: (context, url) => Center(
                  child: TShimmerEffect(width: width, height: height),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: overlayColor ??
                      (isDarkMode ? TColors.white : TColors.dark),
                ),
              )
            : Image.asset(
                image,
                fit: fit,
                color: overlayColor,
              ),
      ),
    );
  }
}
