import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vanlinks_components/vanlinks_colors.dart';

class LoadingWidget extends StatelessWidget {
  final double width, height, radius;
  final Color baseColor, highlightColor;
  final BorderRadius? borderRadius;

  const LoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0.0,
    this.borderRadius = BorderRadius.zero,
    this.baseColor = const Color(0xFFdadada),
    this.highlightColor = const Color(0xFFc6d1e7),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: radius != 0.0
            ? BorderRadius.circular(radius)
            : borderRadius ?? BorderRadius.zero,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: width,
            height: height,
            color: VanlinksColors.whiteColor,
          ),
        ));
  }
}
