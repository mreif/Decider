
import 'package:flutter/material.dart';

class ColorChooser {

  Set<Color> _colors = Set.from([
    Colors.greenAccent,
    Colors.green,
    Colors.lightGreen,
    Colors.teal,
    Colors.yellow,
    Colors.limeAccent,
    Colors.amber,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.lightBlue,
    Colors.blue,
    Colors.cyanAccent,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
  ]);

  Set _usedColors = Set();

  // TODO IMPROVE use colors schemes here
  ColorChooser() {
    // TODO
  }

  Color getColor() {
    if(_colors.isNotEmpty) {
      Color result = _colors.first;
      _usedColors.add(result);
      _colors.remove(result);

      return result;
    } else {
      return Colors.grey;
    }
  }

  void freeColor(Color color) {
    if(_usedColors.contains(color)) {
      _colors.add(color);
      _usedColors.remove(color);
    }
  }
}