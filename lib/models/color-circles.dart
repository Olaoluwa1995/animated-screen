import 'package:flutter/material.dart';

class Circle {
  final int id;
  final Color color;
  final Widget? child;

  Circle({
    required this.id,
    required this.color,
    this.child,
  });
}

class Circles {
  static List<Circle> colorCircles = [
    Circle(
      id: 1,
      color: Colors.redAccent,
    ),
    Circle(
      id: 2,
      color: Colors.greenAccent,
    ),
    Circle(
      id: 3,
      color: Colors.blueAccent,
    ),
    Circle(
      id: 4,
      color: Colors.purple,
    ),
    Circle(
      id: 5,
      color: Colors.purpleAccent,
    ),
    Circle(
      id: 6,
      color: Colors.orangeAccent,
    ), 
    Circle(
      id: 7,
      color: Colors.white,
      child: Icon(Icons.add, color: Colors.black)
    ), 
  ];
}