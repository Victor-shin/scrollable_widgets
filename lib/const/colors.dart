import 'package:flutter/material.dart';

const rainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

Color getRainbowColor(int index) {
  return rainbowColors[index % rainbowColors.length];
}