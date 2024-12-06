import 'package:flutter/material.dart';

LinearGradient linearGradientColors1() {
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 225, 16, 0),
      Color.fromRGBO(255, 228, 42, 0.5),
      Color.fromRGBO(255, 231, 62, 0.9),
      Color.fromRGBO(255, 223, 0, 1),
    ],
    stops: [0, 0.4, 0.8, 1.0],
  );
}
