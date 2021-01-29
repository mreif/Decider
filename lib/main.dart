import 'package:decision_maker/draw/circle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'classes/color_chooser.dart';
import 'classes/drag_item.dart';

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You or me!?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: DecisionMaker(title: 'You or me!?'),
    );
  }
}

class DecisionMaker extends StatefulWidget {
  DecisionMaker({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _DecisionMakerState();
}

class _DecisionMakerState extends State<DecisionMaker> {
  int circleId = 0;
  List<Circle> circles = [];

  ColorChooser _chooser = ColorChooser();

  void touchBegan(Circle c) {
    circles.add(c);

    // TODO if(circles > 1 && they stay the same for a second or so) start procedure
  }

  void touchMoved(Circle c) {
    // Offset is updated by reference.
    // Yet not action to be taken.
  }

  void touchCanceled(Circle c) {
      circles.removeWhere((circle) => circle.id == c.id);
      _chooser.freeColor(c.color);
  }

  void touchEnded(Circle c) {
    circles.removeWhere((circle) => circle.id == c.id);
    _chooser.freeColor(c.color);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey,
        body: RawGestureDetector(
        child: CustomPaint(
          size: Size.infinite,
          painter: Circles(circles),
        ),
        gestures: {
          ImmediateMultiDragGestureRecognizer:
              new GestureRecognizerFactoryWithHandlers<
                      ImmediateMultiDragGestureRecognizer>(
                  () => new ImmediateMultiDragGestureRecognizer(),
                  (ImmediateMultiDragGestureRecognizer instance) {
            instance.onStart = (Offset offset) {
              circleId++;
              var color = _chooser.getColor();

              var circle = Circle(circleId, offset, color);
              this.touchBegan(circle);

              return new ItemDrag((details, cir) {
                setState(() {
                  cir.setOffset(details.globalPosition);
                  this.touchMoved(cir);
                });
              }, (details, cir) {
                setState(() {
                  this.touchEnded(cir);
                });
              }, (cir) {
                setState(() {
                  this.touchCanceled(cir);
                });
              }, circle);
            };
          })
        }));
  }
}