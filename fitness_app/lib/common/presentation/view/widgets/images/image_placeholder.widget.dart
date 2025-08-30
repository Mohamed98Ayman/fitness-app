import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.iconColor,
    this.displayErrorIcon = false,
    this.shape = BoxShape.rectangle,
  });

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool displayErrorIcon;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    final design = context.design;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? design.colors.primaryAppColors.xF5F5F5,
        shape: shape,
      ),
      child:
          displayErrorIcon
              ? Center(
                child: Icon(
                  Icons.hide_image_outlined,
                  color: iconColor ?? design.colors.primaryAppColors.x1D1D1D,
                ),
              )
              : null,
    );
  }
}
