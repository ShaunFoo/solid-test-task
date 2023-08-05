import 'dart:math';
import 'package:flutter/material.dart';

class ColorUtil {
  static Color generateRandomColor() {
    List<Color> colorList = new List.from(Colors.primaries)
      ..addAll(Colors.accents);
    return colorList[Random().nextInt(colorList.length)];
  }
}
