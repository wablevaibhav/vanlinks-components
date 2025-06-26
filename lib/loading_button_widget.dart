import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.buttonText,
    this.width = 247.0,
    this.height = 57.0,
    this.radius = 30.0,
    this.style,
  });

  final String buttonText;
  final double width;
  final double height;
  final double radius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle = style ??
        VanlinksTextStyle.subheadingH6.copyWith(
          color: VanlinksColors.blueColor,
        );
    final double loaderSize = UIHelpers.screenWidth(context) * 0.06;

    return CustomButton(
      backgroundColor: VanlinksColors.blackColor,
      borderColor: VanlinksColors.blackColor,
      radius: radius,
      height: height,
      width: width,
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
          const Gap(8),
          Text(buttonText, style: buttonTextStyle).noFontScaling(context),
        ],
      ),
    );
  }
}
