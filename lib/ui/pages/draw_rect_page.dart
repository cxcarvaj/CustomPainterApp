import 'package:custom_paint/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DrawRectPage extends StatefulWidget {
  const DrawRectPage({super.key});

  @override
  State<DrawRectPage> createState() => _DrawRectPageState();
}

class _DrawRectPageState extends State<DrawRectPage> {
  double _xPosition = 10;
  double _yPosition = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Draw Rect'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: DrawRectPainter(
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
            const SizedBox(height: 16.0),
            PositionSlider(
              positionLabel: 'X Position: ${_xPosition.round()}',
              minValue: 10,
              position: _xPosition,
              onChanged: (double value) {
                _xPosition = value;
                setState(() {});
              },
            ),
            PositionSlider(
              positionLabel: 'Y Position: ${_yPosition.round()}',
              minValue: 5,
              position: _yPosition,
              onChanged: (double value) {
                _yPosition = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawRectPainter extends CustomPainter {
  final double xPosition;
  final double yPosition;

  const DrawRectPainter({required this.xPosition, required this.yPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;

    final rectOne = Rect.fromLTWH(0, 0, xPosition, yPosition);
    // final rectTwo = Rect.fromCenter(
    //   center: const Offset(100, 100),
    //   width: xPosition,
    //   height: yPosition,
    // );
    canvas.drawRect(rectOne, paint);
    // canvas.drawRect(rectTwo, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
