import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: VanLinkAlert.style(
        style: VanlinksAlertStyle.danger,
        title: "Oops!",
        message:
            "There was an error retrieving the resource. Click here to try again.",
        titleTextStyle: VanlinksTextStyle.normal.copyWith(
          color: VanlinksColors.blackColor,
        ),
      ),
    );
  }
}
