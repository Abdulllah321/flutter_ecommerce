import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/shimmmer_effect.dart'; // Make sure the import is correct for TShimmerEffect

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.transparent,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = true,
    this.onPressed,
    this.borderRadius = 8.0,
    this.boxShadow,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            boxShadow: boxShadow,
            borderRadius:
                applyImageRadius ? BorderRadius.circular(borderRadius) : null,
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    placeholder: (context, url) {
                      return TShimmerEffect(
                        width: double.infinity,
                        height: height ??
                            200, // Use the provided height or default to 200
                      );
                    },
                    errorWidget: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  )
                : Image.asset(
                    imageUrl,
                    fit: fit,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
