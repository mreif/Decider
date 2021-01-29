import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle {

 static final double RADIUS = 45;

  final int id;
  final Color color;
  Offset offset;
  Paint style;

  Circle(this.id, this.offset, this.color) {
    this.style = Paint()
      ..color = color
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;
  }

  void setOffset(Offset offset) {
    this.offset = offset;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Circle &&
              id == other.id;
}

class Circles extends CustomPainter {
  List<Circle> _circles = [];

  Circles(this._circles);

  @override
  void paint(Canvas canvas, Size size) {
    _circles.forEach((c) {
      canvas.drawCircle(c.offset, Circle.RADIUS, c.style);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
