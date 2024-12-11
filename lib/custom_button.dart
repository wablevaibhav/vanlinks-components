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
    this.iconColor = Colors.white, // Default color for icon
    this.width,
    this.height = 57.0, // Default height
    this.radius = 5.0, // Default radius
    this.elevation = 5.0, // Default elevation
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;
  final IconData? iconData;
  final Color iconColor;
  final double? width;
  final double height;
  final double radius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      alignment: Alignment.center,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
          color: borderColor ?? Theme.of(context).primaryColor,
        ),
      ),
      fixedSize: Size(width ?? UIHelpers.screenWidth(context) * 1.0, height),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: iconData != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(iconData, color: iconColor),
                const SizedBox(width: 8), // Spacing between icon and child
                child,
              ],
            )
          : child,
    );
  }
}
