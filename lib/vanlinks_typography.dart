import 'package:flutter/material.dart';

class VanlinksTextStyle {
  VanlinksTextStyle._();

  // **Base Variables**
  static const String _fontFamily = 'Roboto';
  static final Color _fontColor = Colors.grey.shade900;
  static final Color _fontHintColor = Colors.grey.shade700;
  static const FontWeight _fontWeight = FontWeight.normal;

  // **Base Styles**
  static final TextStyle _baseTextStyle = TextStyle(
    fontFamily: _fontFamily,
    color: _fontColor,
    fontWeight: _fontWeight,
  );

  static final TextStyle _hintTextStyle = TextStyle(
    fontFamily: _fontFamily,
    color: _fontHintColor,
    fontWeight: _fontWeight,
  );

  // **Headings**
  static final TextStyle headingH1 = _baseTextStyle.copyWith(
    fontSize: 48.0,
    letterSpacing: 0.42,
    height: 32.0 / 28.0,
  );

  static final TextStyle headingH2 = _baseTextStyle.copyWith(
    fontSize: 40.0,
    letterSpacing: 0.36,
    height: 32.0 / 24.0,
  );

  static final TextStyle subheadingH3 = _baseTextStyle.copyWith(
    fontSize: 32.0,
    letterSpacing: 0.3,
    height: 26.0 / 20.0,
  );

  static final TextStyle subheadingH4 = _baseTextStyle.copyWith(
    fontSize: 28.0,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  static final TextStyle subheadingH5 = _baseTextStyle.copyWith(
    fontSize: 24.0,
    letterSpacing: 0.24,
    height: 21.0 / 16.0,
  );

  static final TextStyle subheadingH6 = _baseTextStyle.copyWith(
    fontSize: 20.0,
    letterSpacing: 0.21,
    height: 20.0 / 16.0,
  );

  // **Body / Normal Text**
  static final TextStyle normal = _baseTextStyle.copyWith(
    fontSize: 18.0,
    letterSpacing: 0.24,
    height: 24.0 / 16.0,
  );

  static final TextStyle small = _baseTextStyle.copyWith(
    fontSize: 16.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static final TextStyle hint = _hintTextStyle.copyWith(
    fontSize: 14.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static final TextStyle mediumHint = _hintTextStyle.copyWith(
    fontSize: 12.0,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  static final TextStyle smallHint = _hintTextStyle.copyWith(
    fontSize: 10.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static final TextStyle regularTextStyle = _baseTextStyle.copyWith(
    fontSize: 16.0,
    letterSpacing: 0.4,
    height: 34.0 / 16.0,
  );
}
