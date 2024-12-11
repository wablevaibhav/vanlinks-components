import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.buttonText,
    this.radius = 5.0,
    this.width = 83.0,
    this.backgroundColor = VanlinksColors.blackColor,
    this.borderColor = VanlinksColors.blackColor,
    this.textStyle,
    this.onTap,
  });

  final String buttonText;
  final double radius;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          buttonText,
          style: textStyle ??
              VanlinksTextStyle.hint.copyWith(
                color: VanlinksColors.whiteColor,
              ),
        ),
      ),
    );
  }
}
