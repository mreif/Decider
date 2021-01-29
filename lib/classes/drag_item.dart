import 'package:decision_maker/draw/circle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


/* TODO Improve: Encaspulate the multi touch functionality from the concrete
                 use case to make it available as library.
               */
class ItemDrag extends Drag {
  final Function onUpdate;
  final Function onEnd;
  final Function onCancel;
  final Circle circle;

  ItemDrag(this.onUpdate, this.onEnd, this.onCancel, this.circle);

  @override
  void update(DragUpdateDetails details) {
    super.update(details);
    onUpdate(details, circle);
  }

  @override
  void end(DragEndDetails details) {
    super.end(details);
    onEnd(details, circle);
  }
  @override
  void cancel() {
    super.cancel();
    onCancel(circle);
  }
}

