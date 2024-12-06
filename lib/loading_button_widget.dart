import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class LoadingButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? style;

  const LoadingButton({
    super.key,
    required this.buttonText,
    this.width,
    this.height,
    this.radius,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = style ??
        VanlinksTextStyle.subheadingH6.copyWith(
          color: VanlinksColors.whiteColor,
        );
    final loaderSize = UIHelpers.screenWidth(context) * 0.06;

    return CustomButton(
      backgroundColor: VanlinksColors.blackColor,
      borderColor: VanlinksColors.blackColor,
      radius: radius ?? 30,
      height: height,
      width: width ?? 247,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.discreteCircle(
            secondRingColor: VanlinksColors.whiteColor,
            thirdRingColor: VanlinksColors.primaryColor,
            color: VanlinksColors.primaryColor,
            size: loaderSize,
          ),
          UIHelpers.smallSpace,
          Text(buttonText, style: buttonTextStyle),
        ],
      ),
    );
  }
}
