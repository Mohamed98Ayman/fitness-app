import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common/presentation/view/widgets/images/image_placeholder.widget.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.color,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BoxShape shape;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      fit: fit,
      errorWidget:
          (_, __, ___) => ImagePlaceholder(
            width: width,
            height: height,
            shape: shape,
            displayErrorIcon: true,
            backgroundColor: color?.withValues(alpha: 0.5),
          ),
      progressIndicatorBuilder:
          (_, __, ___) => ImagePlaceholder(
            width: width,
            height: height,
            shape: shape,
            displayErrorIcon: false,
            backgroundColor: color?.withValues(alpha: 0.5),
          ),
      fadeInDuration: const Duration(milliseconds: 250),
      fadeOutDuration: const Duration(milliseconds: 250),
      color: color,
      colorBlendMode: color == null ? null : BlendMode.srcATop,
    );
  }
}
