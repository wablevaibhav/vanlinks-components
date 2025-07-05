import 'package:flutter/material.dart';

const LinearGradient linearGradientColors1 = LinearGradient(
  begin: Alignment(0.07, -1.00),
  end: Alignment(-0.07, 1),
  colors: [
    Color(0xFFFFDF00),
    Color(0xFFFFF7BE),
    Colors.white,
  ],
);

const LinearGradient linearGradientColors2 = LinearGradient(
  begin: Alignment(1.00, 0.01),
  end: Alignment(-1, -0.01),
  colors: [
    Color(0xFFFFDF00),
    Color(0xB2FFDF00),
    Colors.transparent,
  ],
);

const BoxShadow boxShadowColors = BoxShadow(
  color: Color(0x3F000000),
  blurRadius: 7,
  offset: Offset(0, 4),
  spreadRadius: 2,
);
