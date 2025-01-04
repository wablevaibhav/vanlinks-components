import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_typography.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {super.key, this.name, this.padding = const EdgeInsets.all(8.0)});

  final String? name;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Text(
          name ?? "No data available",
          style: VanlinksTextStyle.subheadingH4.copyWith(fontSize: 18.0),
        ),
      ),
    );
  }
}
