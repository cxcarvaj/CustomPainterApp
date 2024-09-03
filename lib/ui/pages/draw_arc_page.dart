import 'dart:math';

import 'package:flutter/material.dart';

class DrawArcPage extends StatefulWidget {
  const DrawArcPage({super.key});

  @override
  State<DrawArcPage> createState() => _DrawArcPageState();
}

class _DrawArcPageState extends State<DrawArcPage> {
  final double _xPosition = 100;
  final double _yPosition = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Draw Arc'),
      ),
      body: Center(
        child: CustomPaint(
          painter: DrawArcPainter(
            xPosition: _xPosition,
            yPosition: _yPosition,
          ),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawArcPainter extends CustomPainter {
  final double xPosition;
  final double yPosition;

  const DrawArcPainter({required this.xPosition, required this.yPosition});
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = Colors.yellow;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.width, center.height),
        width: xPosition,
        height: yPosition,
      ),
      0.4,
      2 * pi - 0.8,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
