import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

enum VanlinksAlertStyle {
  success,
  info,
  warning,
  danger,
}

extension VanlinksAlertStyleColorExtension on VanlinksAlertStyle {
  Color textColor() {
    switch (this) {
      case VanlinksAlertStyle.success:
        return const Color(0xFF186429);
      case VanlinksAlertStyle.info:
        return const Color(0xFF1B489B);
      case VanlinksAlertStyle.warning:
        return const Color(0xFF997404);
      case VanlinksAlertStyle.danger:
        return const Color(0xFF842029);
    }
  }

  Color backgroundColor() {
    switch (this) {
      case VanlinksAlertStyle.success:
        return const Color(0xFFD4EDDA);
      case VanlinksAlertStyle.info:
        return const Color(0xFFD1ECF1);
      case VanlinksAlertStyle.warning:
        return const Color(0xFFFFF3CD);
      case VanlinksAlertStyle.danger:
        return const Color(0xFFF8D7DA);
    }
  }

  Color iconColor() {
    switch (this) {
      case VanlinksAlertStyle.success:
        return const Color(0xFF186429);
      case VanlinksAlertStyle.info:
        return const Color(0xFF0E616E);
      case VanlinksAlertStyle.warning:
        return const Color(0xFF997404);
      case VanlinksAlertStyle.danger:
        return const Color(0xFF842029);
    }
  }

  IconData iconData() {
    switch (this) {
      case VanlinksAlertStyle.success:
        return VanlinksIcons.success;
      case VanlinksAlertStyle.info:
        return VanlinksIcons.info;
      case VanlinksAlertStyle.warning:
        return VanlinksIcons.warning;
      case VanlinksAlertStyle.danger:
        return VanlinksIcons.warning;
    }
  }
}

class VanLinkAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Icon icon;
  final BorderRadius borderRadius;
  final Color titleColor;
  final Color messageColor;
  final double iconSpacing;
  final EdgeInsets iconPadding;
  final EdgeInsets textPadding;
  final double maxWidth;
  final TextStyle titleTextStyle;
  final TextStyle messageTextStyle;

  VanLinkAlert(
      {super.key,
      required this.title,
      required this.message,
      required this.onTap,
      this.padding = const EdgeInsets.all(15.0),
      required this.backgroundColor,
      required this.icon,
      this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
      Color? titleColor,
      Color? messageColor,
      this.iconSpacing = 9.0,
      this.iconPadding = const EdgeInsets.only(top: 4.0),
      this.textPadding = const EdgeInsets.all(0.0),
      this.maxWidth = double.infinity,
      TextStyle? titleTextStyle,
      TextStyle? messageTextStyle})
      : titleColor = titleColor ?? VanlinksColors.darkGray,
        messageColor = messageColor ?? VanlinksColors.mediumGray,
        titleTextStyle = titleTextStyle ?? VanlinksTextStyle.small,
        messageTextStyle = messageTextStyle ?? VanlinksTextStyle.small;

  factory VanLinkAlert.style(
      {required VanlinksAlertStyle style,
      required String title,
      required String message,
      VoidCallback? onTap,
      double iconSize = 16.0,
      double maxWidth = double.infinity,
      TextStyle? titleTextStyle,
      TextStyle? messageTextStyle}) {
    return VanLinkAlert(
        title: title,
        message: message,
        onTap: onTap,
        backgroundColor: style.backgroundColor(),
        icon: Icon(
          style.iconData(),
          color: style.iconColor(),
          size: iconSize,
        ),
        maxWidth: maxWidth,
        titleColor: style.textColor(),
        messageColor: style.textColor(),
        titleTextStyle: titleTextStyle,
        messageTextStyle: messageTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: iconPadding,
              child: icon,
            ),
            Gap(iconSpacing),
            Expanded(
              child: Padding(
                padding: textPadding,
                child: RichText(
                  text: TextSpan(
                    text: "$title ",
                    style: titleTextStyle.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: message,
                        style: messageTextStyle.copyWith(
                          color: messageColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
