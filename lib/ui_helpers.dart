import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class UIHelpers {
  static hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  // Spacing using Gap (works for both horizontal and vertical)
  static const Widget tinySpace = Gap(5.0);
  static const Widget smallSpace = Gap(10.0);
  static const Widget regularSpace = Gap(15.0);
  static const Widget smallRegularSpace = Gap(20.0);
  static const Widget mediumSpace = Gap(30.0);
  static const Widget largeSpace = Gap(35.0);

  // Padding Constants
  static const EdgeInsets paddingTiny = EdgeInsets.all(5.0);
  static const EdgeInsets paddingSmall = EdgeInsets.all(10.0);
  static const EdgeInsets paddingRegular = EdgeInsets.all(15.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(20.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(30.0);

  // Margin Constants
  static const EdgeInsets marginTiny = EdgeInsets.all(5.0);
  static const EdgeInsets marginSmall = EdgeInsets.all(10.0);
  static const EdgeInsets marginRegular = EdgeInsets.all(15.0);
  static const EdgeInsets marginMedium = EdgeInsets.all(20.0);
  static const EdgeInsets marginLarge = EdgeInsets.all(30.0);

  // Dividers for separation
  static const Widget verticalDividerSmall = Divider(
    height: 10.0,
    color: Colors.grey,
  );
  static const Widget verticalDividerRegular = Divider(
    height: 15.0,
    color: Colors.grey,
  );
  static const Widget verticalDividerMedium = Divider(
    height: 30.0,
    color: Colors.grey,
  );
  static const Widget horizontalDivider = VerticalDivider(
    width: 1.0,
    color: Colors.grey,
  );

  // Custom dividers if dynamic sizes are needed
  static Widget verticalDivider(double height) => Divider(
        height: height,
        color: Colors.grey,
      );
  static Widget horizontalDividerDynamic(double width) => VerticalDivider(
        width: width,
        color: Colors.grey,
      );

  // Screen width and height utilities
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Get screen height percentage
  static double screenHeightPercentage(BuildContext context,
          {double percentage = 1}) =>
      screenHeight(context) * percentage;

  // Get screen width percentage
  static double screenWidthPercentage(BuildContext context,
          {double percentage = 1}) =>
      screenWidth(context) * percentage;

  // Get fractional screen height
  static double screenHeightFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0}) =>
      (screenHeight(context) - offsetBy) / dividedBy;

  // Get fractional screen width
  static double screenWidthFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0}) =>
      (screenWidth(context) - offsetBy) / dividedBy;

  // Half and third screen width/height
  static double halfScreenWidth(BuildContext context) =>
      screenWidthFraction(context, dividedBy: 2);
  static double halfScreenHeight(BuildContext context) =>
      screenHeightFraction(context, dividedBy: 2);
  static double thirdScreenWidth(BuildContext context) =>
      screenWidthFraction(context, dividedBy: 3);

  // Get responsive font size based on screen width
  static double getResponsiveFontSize(BuildContext context,
      {double? fontSize, double? max}) {
    max ??= 100;
    var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max,
    );
    return responsiveSize;
  }
}
