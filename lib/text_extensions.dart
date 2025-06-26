import 'package:flutter/material.dart';

extension FixedText on Text {
  Widget noFontScaling(
    BuildContext context, {
    BoxFit fit = BoxFit.scaleDown,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign? textAlign,
  }) {
    return MediaQuery(
      data: MediaQueryData.fromView(View.of(context)).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: FittedBox(
        fit: fit,
        child: Text(
          data ?? '',
          style: style,
          textAlign: textAlign ?? this.textAlign,
          overflow: overflow,
          maxLines: maxLines,
          textDirection: textDirection,
        ),
      ),
    );
  }
}


