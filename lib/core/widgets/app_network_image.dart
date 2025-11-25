import 'package:flutter/material.dart';
import 'package:movie_review/core/widgets/app_shimmer.dart';


class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final String fallbackAsset;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.fallbackAsset = "assets/images/burger_king.png",
  });

  @override
  Widget build(BuildContext context) {
    final isImageMissing = imageUrl.trim().isEmpty;

    final imageWidget = isImageMissing
        ? Image.asset(
            fallbackAsset,
            width: width,
            height: height,
            fit: fit,
          )
        : Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return AppShimmer.circular(height: height, width: width);
            },
            errorBuilder: (context, error, stackTrace) => Image.asset(
              fallbackAsset,
              width: width,
              height: height,
              fit: fit,
            ),
          );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
