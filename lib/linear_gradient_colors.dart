import 'package:flutter/material.dart';

LinearGradient linearGradientColors1() {
  return const LinearGradient(
    begin: Alignment(0.07, -1.00),
    end: Alignment(-0.07, 1),
    colors: [Color(0xFFFFDF00), Color(0xFFFFF7BE), Colors.white],
  );
}

LinearGradient linearGradientColors2() {
  return LinearGradient(
    begin: const Alignment(1.00, 0.01),
    end: const Alignment(-1, -0.01),
    colors: [
      const Color(0xFFFFDF00),
      const Color(0xB2FFDF00),
      Colors.black.withOpacity(0)
    ],
  );
}

BoxShadow boxShadowColors() {
  return const BoxShadow(
    color: Color(0x3F000000),
    blurRadius: 7,
    offset: Offset(0, 4),
    spreadRadius: 2,
  );
}
