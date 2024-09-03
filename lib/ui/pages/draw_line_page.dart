import 'package:custom_paint/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DrawLinePage extends StatefulWidget {
  const DrawLinePage({super.key});

  @override
  State<DrawLinePage> createState() => _DrawLinePageState();
}

class _DrawLinePageState extends State<DrawLinePage> {
  double _xPosition = 0;
  double _yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Draw Line'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: DrawLinePainter(
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
              position: _xPosition,
              onChanged: (double value) {
                _xPosition = value;
                setState(() {});
              },
            ),
            PositionSlider(
              positionLabel: 'Y Position: ${_yPosition.round()}',
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

class DrawLinePainter extends CustomPainter {
  final double xPosition;
  final double yPosition;

  const DrawLinePainter({required this.xPosition, required this.yPosition});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    const startPoint = Offset(0.0, 0.0);
    final endPoint = Offset(xPosition, yPosition);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
