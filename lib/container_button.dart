import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.buttonText,
    this.radius,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.onTap,
  });

  final String buttonText;
  final double? radius;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 83,
        decoration: BoxDecoration(
          color: backgroundColor ?? VanlinksColors.blackColor,
          borderRadius: BorderRadius.circular(radius ?? 5),
          border: Border.all(
            color: borderColor ?? VanlinksColors.blackColor,
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
