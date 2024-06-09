import 'package:flutter/material.dart';

final AppTextStyles textStyles = AppTextStyles();

class AppTextStyles {
  final TextStyle h1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle h2 = const TextStyle(
    fontSize: 25,
  );
  final TextStyle h3 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final TextStyle body = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
}
