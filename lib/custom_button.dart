import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    required this.child,
    this.iconData,
    this.iconColor,
    this.width,
    this.height,
    this.radius,
    this.elevation,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;
  final IconData? iconData;
  final Color? iconColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: elevation ?? 5,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5),
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        fixedSize:
            Size(width ?? UIHelpers.screenWidth(context) * 1.0, height ?? 57),
      ),
      child: child,
    );
  }
}
